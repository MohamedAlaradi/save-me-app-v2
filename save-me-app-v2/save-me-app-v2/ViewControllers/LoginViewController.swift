//
//  LoginViewController.swift
//  SaveMe
//
//  Created by Mohamed Alaradi on 12/10/19.
//  Copyright © 2019 BahrainPolytechnic. All rights reserved.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
    
    

    @IBOutlet weak var txtEmail: TextFieldStyle!
    
    @IBOutlet weak var txtPassword: TextFieldStyle!
    @IBOutlet weak var lblErrorMag: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self.view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tap)
        //Set up text fields with and border at the bottom and disable error label
        txtEmail.setBottomBorder()
        txtPassword.setBottomBorder()
        lblErrorMag.isHidden = true;
        

        // Do any additional setup after loading the view.
    }
    
    func validateFeilds() -> String?{
        if txtEmail.text?.trimmingCharacters(in: .whitespacesAndNewlines) == "" || txtPassword.text?.trimmingCharacters(in: .whitespacesAndNewlines) == ""{
            
            return "Please fill in all Feilds"
            
        }
        return nil
    }
    
    func showError (_ message :String){
        lblErrorMag.text = message
        lblErrorMag.isHidden = false
        
    }
    
    //transfare to the home screen view controller
    //make the home screen as the root view controller so when the user lunchs the app again he will be in the home screen instade of the signin/signup screen
    func transitionToHome(){
        let homeViewController = storyboard?.instantiateViewController(identifier: Constants.StoryBoard.homeViewController) as? HomeTableViewController
        
        view.window?.rootViewController = homeViewController
        view.window?.makeKeyAndVisible()
    }
    
 

                               
                           }
                           
                           


        



    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


