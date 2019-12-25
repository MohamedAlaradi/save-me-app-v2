//
//  PastBookingTableViewController.swift
//  SaveMe
//
//  Created by Adel Janahi on 12/24/19.
//  Copyright © 2019 BahrainPolytechnic. All rights reserved.
//

import UIKit

class PastBookingTableViewController: UITableViewController {
    
    let data = [
        BookingData(logo: "iFixLogo", companyName: "iFix Bahrain", date: Date(), totalAmount: 22.0, services: [Service(name: "AC Cleaning", quantity: 2, price: 20.0), Service(name: "Light Bulb Replacement", quantity: 4, price: 2.0)]),
        BookingData(logo: "iFixLogo", companyName: "iFix Bahrain", date: Date(), totalAmount: 22.0, services: [Service(name: "AC Cleaning", quantity: 2, price: 20.0), Service(name: "Light Bulb Replacement", quantity: 4, price: 2.0)])
    ]
    
    struct BookingData {
        var logo: String
        var companyName: String
        var date = Date()
        var totalAmount: Double
        var services = [Service]()
    }

    struct Service {
        var name: String
        var quantity: Int
        var price: Double
    }
    
    var selectedIndex: IndexPath = IndexPath(row: 0, section: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = 100
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return data.count
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HistoryCell", for: indexPath) as! PastBookingTableViewCell
        
        cell.updateUI(logo: data[indexPath.row].logo, expand: (UIImage(named: "Controls Small - Arrow - Fw"))!, title: data[indexPath.row].companyName, date: "2/12/2019", time: "12:00 PM", totalPrice: data[indexPath.row].totalAmount, price: data[indexPath.row].services[indexPath.row].price, services: data[indexPath.row].services[indexPath.row].name)
        
        cell.selectionStyle = .none
        cell.animate()
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        if selectedIndex == indexPath {
            tableView.estimatedRowHeight = tableView.rowHeight
            
            return UITableView.automaticDimension}
        return 100
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        selectedIndex = indexPath
        
        tableView.beginUpdates()
        tableView.reloadRows(at: [selectedIndex], with: .none)
        tableView.endUpdates()
    }

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
