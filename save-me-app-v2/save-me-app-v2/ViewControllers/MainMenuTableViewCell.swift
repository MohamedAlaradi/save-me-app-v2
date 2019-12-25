//
//  MainMenuTableViewCell.swift
//  SaveMe
//
//  Created by Mohamed Alaradi on 12/18/19.
//  Copyright © 2019 BahrainPolytechnic. All rights reserved.
//

import UIKit

class MainMenuTableViewCell: UITableViewCell {

    @IBOutlet weak var ServiceTitle: UILabel!
    @IBOutlet weak var PricPerUnit: UILabel!
    @IBOutlet weak var ServiceDescription: UILabel!
    @IBOutlet weak var ServicePrice: UILabel!
    
    /*var service : Service?{
        didSet{
            self.updateUI()
        }
    }*/
    
    func updateUI(with service:Service){
        
        ServiceTitle?.text = service.ServiceTitle
        ServicePrice?.text = String(service.SrvicePrice)
        ServiceDescription.text = service.ServiceDescription
        PricPerUnit.text = "Price Per Unit: "
        
    }

}
