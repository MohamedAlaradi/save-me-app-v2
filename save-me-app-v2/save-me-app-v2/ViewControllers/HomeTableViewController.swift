//
//  HomeTableViewController.swift
//  SaveMe
//
//  Created by Mohamed Alaradi on 12/18/19.
//  Copyright © 2019 BahrainPolytechnic. All rights reserved.
//

import UIKit
import Firebase

class HomeTableViewController: UITableViewController {
    
    
    @IBOutlet var expandBtn: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
         self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        
        tableView.estimatedRowHeight = tableView.rowHeight
        tableView.rowHeight = UITableView.automaticDimension
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return WelecomeViewController.categories.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        // #warning Incomplete implementation, return the number of rows
        if (WelecomeViewController.categories[section]?.isExpanded)!{
            if let numOfServices = WelecomeViewController.categories[section]?.services.count {
                return numOfServices
            } else{
               return 0
            }
        }else{
            return 0
        }
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ServiceCell", for: indexPath) as! MainMenuTableViewCell
        
        let categ = WelecomeViewController.categories[indexPath.section]
        let services = categ!.services
        let service = services[indexPath.row]!
        print(services[indexPath.row]!)
        cell.updateUI(with: service)
        
        return cell
    }
    
    /*override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if let serviceCateg = WelecomeViewController.categories[section]{
            if serviceCateg.services.isEmpty{
                return nil
            }else{
                return serviceCateg.category}
        }
        return nil
    }*/
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

        let header = tableView.dequeueReusableCell(withIdentifier: "SectionHeader") as! SectionHeaderTableViewCell
        
        let button = UIButton(type: .system)
        button.setImage(UIImage(named: "Controls Small - Arrow"), for: .normal)
        button.tag = section
        print("Button tag is \(button)")
        //button.addTarget(self, action: #selector(handleExpandCollapse), for: .touchUpInside)
        
        let serviceCateg = (WelecomeViewController.categories[section])!
        let title = serviceCateg.category
        let image = (UIImage(named: title))!
        
        header.updateUI(image: image, sectionTitle: title)
        print(header)
        
        /*let peach = UIColor(red: 243.0/255.0, green: 216.0/255.0, blue: 185.0/255.0, alpha: 1.0)
        button.setImage(UIImage(named: "Controls Small - Arrow"), for: .normal)
        button.backgroundColor = peach
        button.tag = section*/
        
        //button.addTarget(self, action: #selector(handleExpandCollapse), for: .touchUpInside)
        
        /*if let serviceCateg = WelecomeViewController.categories[section]{
            if serviceCateg.services.isEmpty{
                return nil
            }else{
                return button//serviceCateg.category}
        }*/
    //}
        return header
    }
    
    
    func Collaps(section : Int){
        
        //Collapse All elements of a section by deleteing them
        var indexPaths = [IndexPath]()
        for row in (WelecomeViewController.categories[section]?.services.indices)!{
            let indexPath = IndexPath(row: row, section: section)
            print(section)
            print(indexPath)
            indexPaths.append(indexPath)
        }
        
        if let expandedState = WelecomeViewController.categories[section]?.isExpanded{
            WelecomeViewController.categories[section]?.isExpanded = !expandedState}
        
        if let expandedState = WelecomeViewController.categories[section]?.isExpanded {
            if expandedState{
                tableView.insertRows(at: indexPaths, with: .top)
                //button.setImage(UIImage(named: "Controls Small - Arrow"), for: .normal)
            }else{
                tableView.deleteRows(at: indexPaths, with: .top)
                //button.setImage(UIImage(named: "Controls Small - ArrowDown"), for: .normal)
            }
        }
    }
    
    
    
    
    @objc func handleExpandCollapse(button : UIButton){
        print("Testing expand and close .........")
        let section = button.tag
        print(button.tag)
        
        //Collapse All elements of a section by deleteing them
        var indexPaths = [IndexPath]()
        for row in (WelecomeViewController.categories[section]?.services.indices)!{
            let indexPath = IndexPath(row: row, section: section)
            indexPaths.append(indexPath)
        }
        
        if let expandedState = WelecomeViewController.categories[section]?.isExpanded{
            WelecomeViewController.categories[section]?.isExpanded = !expandedState}
        
        if let expandedState = WelecomeViewController.categories[section]?.isExpanded {
            if expandedState{
                tableView.insertRows(at: indexPaths, with: .top)
                //button.setImage(UIImage(named: "Controls Small - Arrow"), for: .normal)
            }else{
                tableView.deleteRows(at: indexPaths, with: .top)
                //button.setImage(UIImage(named: "Controls Small - ArrowDown"), for: .normal)
            }
        }
    }
    
    override func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    
    
    

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
