//
//  extension+ViewController.swift
//  KolYoumAya
//
//  Created by Islam Abotaleb on 7/21/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
extension UIViewController {
    
    //    let bundle = Bundle(for: type(of: self))
    //    let nib = UINib(nibName: String(describing: type(of: self)), bundle: bundle)
    //    let view = nib.instantiate(withOwner: self, options: nil)[0] as! UIView
    //    return view
    //
    
    //MARK: Instantiate Function For Identifier
    static func instantiate<T>() -> T {
        let nib = UINib(nibName: "\(T.self)", bundle: Bundle.main)
        let view = nib.instantiate(withOwner: self, options: nil).first as! T
        return view
    }
  
}

//extension UIView {
//
//    func instantiateFromNib<T: UIView>() -> T? {
//
//        return UINib(nibName: "\(self)", bundle: nil).instantiate(withOwner: nil, options: nil).first as? T
//    }
//}
