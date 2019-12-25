//
//  Email.swift
//  SaveMe
//
//  Created by Adel Janahi on 12/25/19.
//  Copyright © 2019 BahrainPolytechnic. All rights reserved.
//

import Foundation
import UIKit
import MessageUI

class EmailViewController: UIViewController {
    
    @IBAction func emailBtnTapped(_ sender: Any) {
        showMailComposer()
    }
    func showMailComposer() {
        guard MFMailComposeViewController.canSendMail() else {
            return
        }
        
        let composer = MFMailComposeViewController()
        composer.mailComposeDelegate = self
        composer.setToRecipients(["save-me-app@gmail.com"])
        
        present(composer, animated: true)
    }
}

extension EmailViewController: MFMailComposeViewControllerDelegate {
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if let _ = error {
            controller.dismiss(animated: true)
            return
        }
        
        switch result {
        case .cancelled:
            print("Cancelled")
        case .failed:
            print("Failed")
        case .saved:
            print("Saved")
        case .sent:
            print("Sent")
        }
        
        controller.dismiss(animated: true)
    }
}
