//
//  SectionHeaderTableViewCell.swift
//  SaveMe
//
//  Created by Mohamed Alaradi on 12/23/19.
//  Copyright © 2019 BahrainPolytechnic. All rights reserved.
//

import UIKit

class SectionHeaderTableViewCell: UITableViewCell {

    @IBOutlet weak var CategoryImg: UIImageView!
    @IBOutlet weak var Title: UILabel!
    
    
    func updateUI(image : UIImage, sectionTitle : String){
        
        CategoryImg.image = image
        Title.text = sectionTitle
    }
    
}
