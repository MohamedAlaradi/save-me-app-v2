//
//  ButtonStyle.swift
//  SaveMe
//
//  Created by Mohamed Alaradi on 12/10/19.
//  Copyright © 2019 BahrainPolytechnic. All rights reserved.
//

import UIKit

@IBDesignable
class ButtonStyle: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0{
        didSet{
            self.layer.cornerRadius = cornerRadius
        }
    }
    
    @IBInspectable var borderWidth : CGFloat = 0{
        didSet{
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var borderColor : UIColor = UIColor.clear{
        didSet{
            self.layer.borderColor = borderColor.cgColor
        }
    }

}
