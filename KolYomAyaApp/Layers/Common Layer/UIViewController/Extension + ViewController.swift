//
//  Extension + ViewController.swift
//  KolYoumAya
//
//  Created by Islam Abotaleb on 7/21/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//



import UIKit
import Kingfisher
let imageCache = NSCache<NSString, UIImage>()

extension UIImageView {
    
    func imageURLLoad(url: URL) {

        DispatchQueue.global().async { [weak self] in
            func setImage(image:UIImage?) {
                DispatchQueue.main.async {
                    self?.image = image
                }
            }
            let urlToString = url.absoluteString as NSString
            if let cachedImage = imageCache.object(forKey: urlToString) {
                setImage(image: cachedImage)
            } else if let data = try? Data(contentsOf: url), let image = UIImage(data: data) {
                DispatchQueue.main.async {
                    imageCache.setObject(image, forKey: urlToString)
                    setImage(image: image)
                }
            }else {
                setImage(image: nil)
            }
        }
    }
     func imageFromURL(urlString: String) {

        let activityIndicator = UIActivityIndicatorView(style: .gray)
           activityIndicator.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
           activityIndicator.startAnimating()
           if self.image == nil{
               self.addSubview(activityIndicator)
           }

           URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

               if error != nil {
                   print(error ?? "No Error")
                   return
               }
               DispatchQueue.main.async(execute: { () -> Void in
                   let image = UIImage(data: data!)
                   activityIndicator.removeFromSuperview()
                   self.image = image
               })

           }).resume()
       }
    func imageFromURLIntoLocalDevice(urlString: String) {

     let activityIndicator = UIActivityIndicatorView(style: .gray)
        activityIndicator.frame = CGRect.init(x: 0, y: 0, width: self.frame.size.width, height: self.frame.size.height)
        activityIndicator.startAnimating()
        if self.image == nil{
            self.addSubview(activityIndicator)
        }

        URLSession.shared.dataTask(with: NSURL(string: urlString)! as URL, completionHandler: { (data, response, error) -> Void in

            if error != nil {
                print(error ?? "No Error")
                return
            }
//            DispatchQueue.main.async(execute: { () -> Void in
//                let image = UIImage(data: data!)
//                activityIndicator.removeFromSuperview()
//                self.image = image
//            })

        }).resume()
    }
        private func getEncodedUrl(from urlString: String) -> URL? {
    
            let urlEncoded = ((Keys.mediaKey + urlString).addingPercentEncoding(withAllowedCharacters: CharacterSet.urlQueryAllowed) ?? "")
            if let url =  URL(string: urlEncoded) {
                print("DisplayGetImageGetEnclode\(url)")
                return url
            }
            return nil
        }
}
extension UIViewController {

  static func swizzlePresent() {

    let orginalSelector = #selector(present(_: animated: completion:))
    let swizzledSelector = #selector(swizzledPresent)

    guard let orginalMethod = class_getInstanceMethod(self, orginalSelector), let swizzledMethod = class_getInstanceMethod(self, swizzledSelector) else{return}

    let didAddMethod = class_addMethod(self,
                                       orginalSelector,
                                       method_getImplementation(swizzledMethod),
                                       method_getTypeEncoding(swizzledMethod))

    if didAddMethod {
      class_replaceMethod(self,
                          swizzledSelector,
                          method_getImplementation(orginalMethod),
                          method_getTypeEncoding(orginalMethod))
    } else {
      method_exchangeImplementations(orginalMethod, swizzledMethod)
    }

  }

  @objc
  private func swizzledPresent(_ viewControllerToPresent: UIViewController,
                               animated flag: Bool,
                               completion: (() -> Void)? = nil) {
    if #available(iOS 13.0, *) {
      if viewControllerToPresent.modalPresentationStyle == .automatic {
        viewControllerToPresent.modalPresentationStyle = .fullScreen
      }
    }
    swizzledPresent(viewControllerToPresent, animated: flag, completion: completion)
   }
}
