//
//  radius+shadow.swift
//  TestAbo
//
//  Created by Amr Itqan on 4/10/18.
//  Copyright © 2018 Admin. All rights reserved.
//

import UIKit

@IBDesignable
class viewshadow: UIView {
    
    @IBInspectable var cornerRadius: CGFloat = 10.0 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    @IBInspectable var shadowColor: UIColor = UIColor.white{
        didSet {
        self.layer.shadowColor = UIColor.white.cgColor
        }
    }
    
    
    @IBInspectable var shadowOpacity: CGFloat = 1.0 {
        didSet {
            self.layer.shadowOpacity = 1
        }
    }
    @IBInspectable var shadowOffset: CGSize = CGSize.zero {
        didSet {
             self.layer.shadowOffset = CGSize.zero
        }
    }
    @IBInspectable var shadowRadius: CGFloat = 2.0 {
        didSet {
            self.layer.shadowRadius = 2
        }
    }
}
    
//    override func awakeFromNib() {
//        super.awakeFromNib()
//
//        self.layer.cornerRadius = 10.0
//
//        self.layer.shadowColor = UIColor.white.cgColor
//        self.layer.shadowOpacity = 1
//        self.layer.shadowOffset = CGSize.zero
//        self.layer.shadowRadius = 2
//
//    }



//@IBInspectable var borderColor: UIColor = AppColors.brightOrange {
//    didSet {
//        self.layer.borderColor = borderColor.cgColor
//    }
//}
//
//@IBInspectable var borderWidth: CGFloat = 3.0 {
//    didSet {
//        self.layer.borderWidth = borderWidth
//    }
//}
//
//@IBInspectable var cornerRadius: CGFloat = 38.5 {
//    didSet {
//        self.layer.cornerRadius = cornerRadius
//    }
//}
