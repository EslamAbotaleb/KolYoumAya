//
//  RoundUIView.swift
//  KolYoumAya
//
//  Created by Islam Abotaleb on 7/23/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
@IBDesignable
class RoundUIView: UIView {
    
    @IBInspectable var borderColor: UIColor = AppColors.brightGreen {
        didSet {
            self.layer.borderColor = borderColor.cgColor
        }
    }
    
    @IBInspectable var borderWidth: CGFloat = 3.0 {
        didSet {
            self.layer.borderWidth = borderWidth
        }
    }
    
    @IBInspectable var cornerRadius: CGFloat = 38.5 {
        didSet {
            self.layer.cornerRadius = cornerRadius
        }
    }
    
//    @IBInspectable var backgroundView: UIView? {
//       
//        didSet {
//            backgroundView!.backgroundColor = UIColor(patternImage: UIImage(named: "rectangle67.png")!)
//        }
//    }
}
