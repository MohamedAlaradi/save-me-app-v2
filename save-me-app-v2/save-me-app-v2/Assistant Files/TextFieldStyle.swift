//
//  TextFieldStyle.swift
//  SaveMe
//
//  Created by Mohamed Alaradi on 12/10/19.
//  Copyright © 2019 BahrainPolytechnic. All rights reserved.
//

import UIKit

class TextFieldStyle: UITextField {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    func setBottomBorder() {
      self.borderStyle = .none
      self.layer.backgroundColor = UIColor.white.cgColor
        var navyBlue = UIColor(red: 59.0/255.0, green: 79.0/255.0, blue: 88.0/255.0, alpha: 1.0)

      self.layer.masksToBounds = false
      self.layer.shadowColor = navyBlue.cgColor
      self.layer.shadowOffset = CGSize(width: 0.0, height: 2.0)
      self.layer.shadowOpacity = 1.0
      self.layer.shadowRadius = 0.0
    }

}
