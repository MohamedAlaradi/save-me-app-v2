//
//  SignupViewController.swift
//  SaveMe
//
//  Created by Mohamed Alaradi on 12/10/19.
//  Copyright © 2019 BahrainPolytechnic. All rights reserved.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore
import Firebase

class SignupViewController: UIViewController {
    
    
    @IBOutlet weak var txtFullName: TextFieldStyle!
    @IBOutlet weak var txtEmail: TextFieldStyle!
    @IBOutlet weak var txtPassword: TextFieldStyle!
    @IBOutlet weak var txtVerifyPassword: TextFieldStyle!
    @IBOutlet weak var txtAddress: TextFieldStyle!
    @IBOutlet weak var txtPhoneNumber: TextFieldStyle!
    
    @IBOutlet weak var lblErrorMsg: UILabel!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        
        //Set up text fields with and border at the bottom and disable error label
        txtFullName.setBottomBorder()
        txtEmail.setBottomBorder()
        txtPassword.setBottomBorder()
        txtVerifyPassword.setBottomBorder()
        txtAddress.setBottomBorder()
        txtPhoneNumber.setBottomBorder()
        
        lblErrorMsg.isHidden = true
        

        // Do any additional setup after loading the view.
    }
    
    //Validate all fields
    //if all field are valid return nill
    //if there was an error in one field return error message
    func validateFeilds () -> String? {
        
        //Validate that all feilds are filled
        if txtFullName.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || txtEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""||txtPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""||txtVerifyPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""||txtAddress.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""||txtPhoneNumber.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            
            return "Please fill in all feilds"
            
        }
        //Validate password and verified password are the same
        //Passwords are beoing forced unwrapped because it has been validated that the feilds were not empty
        if txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines) != txtVerifyPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines){
            
            return "The passwords didn't match"
        }
        
        //Validate the password strengh
        //let cleanedPassword = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
        //if validatePassword(cleanedPassword) == false {
            //return "Password must be at least 8 character with at least one special character"
       // }
        
        
        return nil
    }
    
    //Validates the strenghs of the password
    //taken from https://iosdevcenters.blogspot.com/2017/06/password-validation-in-swift-30.html
    func validatePassword(_ password : String) -> Bool {
        let passwordTest = NSPredicate(format: "SELF MATCHES %@", "^(?=.*[A-Z].*[A-Z])(?=.*[!@#$&*])(?=.*[0-9].*[0-9])(?=.*[a-z].*[a-z].*[a-z]).{8}$")
        return passwordTest.evaluate(with: password)
    }
    
    func showError (_ message :String){
        lblErrorMsg.text = message
        lblErrorMsg.isHidden = false
        
    }
    
    //transfare to the home screen view controller
    //make the home screen as the root view controller so when the user lunchs the app again he will be in the home screen instade of the signin/signup screen
    func transitionToHome(){
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.StoryBoard.homeViewController) as? HomeTableViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
    @IBAction func btnSignupTapped(_ sender: Any) {
        lblErrorMsg.isHidden = true
        
        //validates sign up feilds then calls firebase to create a new user
        if let error = validateFeilds(){
            showError(error)
        } else{
            
            //get all data and trim an white spaces
            
            let name = txtFullName.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let email = txtEmail.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let password = txtPassword.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let address = txtAddress.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            let phoneNumber = txtPhoneNumber.text!.trimmingCharacters(in: .whitespacesAndNewlines)
            
            //Create the user
            Auth.auth().createUser(withEmail: email, password: password) { (results, error) in
                
                if error != nil {
                    print(error)
                    self.showError(error?.localizedDescription ?? "There was an error creating the user")
                } else {
                    let db = Firestore.firestore()
                    
                    db.collection("User").addDocument(data: ["UserID":results!.user.uid,"Name":name,"Email":email,"Password":password,"Address":address,"PhoneNumber":phoneNumber]) { (error) in
                        if error != nil {
                            self.showError("Error at saving user data")
                        }else{
                            self.transitionToHome()
                        }
                    }
                }

            }
        }
        
    }
    

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let locationController = segue.destination as? LocationController else {return}
        
    }
    

    
       @IBAction func didUnwindFromLocationController(_ sender: UIStoryboardSegue) {
           guard let locationController = sender.source as? LocationController else { return }
           txtAddress.text = LocationController.confirmedAddress
       }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
