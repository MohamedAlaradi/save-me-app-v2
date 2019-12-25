//
//  SettingsTableViewController.swift
//  
//
//  Created by Mohamed Alaradi on 12/24/19.
//

import UIKit

class SettingsTableViewController: UITableViewController {

    let settings: [String] = ["Edit Profile", "Change Address", "Notificatin Settings", "Report a Problem", "About Us", "Privacy Policy"]
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
}
