//
//  ViewController.swift
//  SaveMe
//
//  Created by Adel Janahi on 12/3/19.
//  Copyright © 2019 BahrainPolytechnic. All rights reserved.
//

import UIKit
import FirebaseFirestore
import Firebase

class WelecomeViewController: UIViewController {
    
    static var categories = [ServiceCategory?]()
    
    //Declare variables 1- image with refrence to the logo 2- a new spalsh view
    let logo = UIImageView(image: UIImage(named: "Logo"))
    let splashView = UIView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
            FirebaseApp.configure()
            var db = Firestore.firestore()
        
            //set the color of the splash view as white (sane as the launch screen)
            splashView.backgroundColor = UIColor.white
            view.addSubview(splashView)
            
            //set the sokash view the the same size as the device's view size
            splashView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
            
            //set the logo to aspect view (Aussure that it stays in the same when scaled)
            // add the logo to the spalsh view
            logo.contentMode = .scaleAspectFit
            splashView.addSubview(logo)
            
            //scale the logo image by half
            logo.frame = CGRect(x: splashView.frame.midX - 50 , y: splashView.frame.midY - 50, width: 100, height: 100)
        
        
               db.collection("Service").getDocuments() { (querySnapshot, err) in
                   if let err = err {
                       print("Error getting documents: \(err)")
                   } else {
                       for document in querySnapshot!.documents {
                           let newService = Service(ServiceCategory: document.get("Category_ID")! as! Int, ServiceTitle: document.get("Title")! as! String, ServiceID: document.documentID , SrvicePrice: document.get("Price")! as! Double, ServiceDescription: document.get("Desc")! as! String)
                           //print(newService)
                        var counter = 0
                        while (counter < WelecomeViewController.categories.count && !WelecomeViewController.categories.isEmpty){
                            //print(counter)
                            if WelecomeViewController.categories[counter]?.catgeory_id == newService.ServiceCategory {
                                WelecomeViewController.categories[counter]?.services.append(newService)
                                print(counter)
                                //print(WelecomeViewController.categories[counter]?.services)
                                counter += 1
                            }else{
                                counter += 1
                            }
                        }
                       }
                   }
               }
        
                db.collection("Categories").getDocuments() { (querySnapshot, err) in
                    if let err = err {
                        print("Error getting documents: \(err)")
                    } else {
                        for document in querySnapshot!.documents {
                            let categ = ServiceCategory(catgeory_id: document.get("Category_ID")! as! Int, category: document.get("Category")! as! String, isExpanded: true)
                            print(categ)
                            WelecomeViewController.categories.append(categ)
                        }
                    }
                }
        
    }
    
    //delay the start of the application
    override func viewDidAppear(_ animated: Bool) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + 2) {
            self.scaleDownAnimation()
        }
    }
    
    func scaleDownAnimation(){
        //Animation duration 0.5 seconds
        //scale logo image to the half
        //if scaling succeful proceed run second animation
        UIView.animate(withDuration: 0.5, animations:  {
            self.logo.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        }){ (success) in
            self.scaleUpAnimation()
        }
    }
    
    //Animation duration 0.35 with delat 0.1 seconds
    //scale logo image to be 5 times larger
    func scaleUpAnimation() {
        UIView.animate(withDuration: 0.35, delay: 0.1, options: .curveEaseIn, animations: {
            self.logo.transform = CGAffineTransform(scaleX: 5, y: 5)
        }) { (success) in
            self.removeSplashScreen()
        }
    }
    
    //removes splash screen from the user's view
    func removeSplashScreen(){
        splashView.removeFromSuperview()
    }

}

