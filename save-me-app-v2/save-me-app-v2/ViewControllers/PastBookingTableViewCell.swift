//
//  PastBookingTableViewCell.swift
//  SaveMe
//
//  Created by Adel Janahi on 12/24/19.
//  Copyright © 2019 BahrainPolytechnic. All rights reserved.
//

import UIKit



class PastBookingTableViewCell: UITableViewCell {


    @IBOutlet weak var ProviderLogo: UIImageView!
    @IBOutlet weak var Expand: UIImageView!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var Time: UILabel!
    @IBOutlet weak var Services: UILabel!
    @IBOutlet weak var Summary: UILabel!
    @IBOutlet weak var TotalPrice: UILabel!
    @IBOutlet weak var ProviderTitle: UILabel!
    @IBOutlet weak var TotalAmount: UILabel!
    @IBOutlet weak var Price: UILabel!
    
   
    
    func updateUI (logo : String, expand : UIImage, title : String, date : String, time : String, totalPrice : Double, price : Double, services : String){
        
        ProviderLogo.image = UIImage(named:logo)
        ProviderTitle.text = title
        Date.text = date
        Time.text = time
        TotalPrice.text = "\(totalPrice) BHD"
        Summary.text = "Summary"
        Services.text = services
        Price.text = "\(price) BHD"
        
        
    }
    
    func animate() {
        UIView.animate(withDuration: 0.5, delay: 0.3, usingSpringWithDamping: 0.8, initialSpringVelocity: 1, options: .curveEaseIn, animations: {
            self.contentView.layoutIfNeeded()
        })
    }

}
