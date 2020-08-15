//
//  QuaranListenController + ScrollView Extension.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/27/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
extension QuarnListenViewController: UIScrollViewDelegate {
//    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
//
//        print("scrollViewWillBeginDragging")
//        isDataLoading = false
//    }
//
//    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
//        print("scrollViewDidEndDecelerating")
//    }
//    //Pagination
//    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
//        if scrollView == collectionView {
//            print("scrollViewDidEndDragging")
//            if ((collectionView.contentOffset.y + collectionView.frame.size.height) >= collectionView.contentSize.height)
//            {
//                if !isDataLoading{
//                    isDataLoading = true
//
//
//                    let lastlabel = UILabel()
//                    lastlabel.font = UIFont.systemFont(ofSize: 15.0)
//
//                    lastlabel.textAlignment = .center
//
//                    lastlabel.text = "جاري التحميل"
//
//
//
//
//
//                    lastlabel.textColor = UIColor.green
//                    lastlabel.frame = CGRect(x: CGFloat(0), y: CGFloat(0), width: collectionView.bounds.width, height: CGFloat(44))
////                    self.collectionView.section
////                self.collectionView.tableFooterView?.isHidden = false
////                    self.collectionView.collectionViewLayout.
////                    self.collectionView.tableFooterView = lastlabel
////                    self.collectionView.tableFooterView?.isHidden = false
//
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
//                        self.loadMoreReciters()
//                    }
//                }
//            }
//        }
//
//    }
//
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
            let threshold   = 100.0 ;
            let contentOffset = scrollView.contentOffset.y;
            let contentHeight = scrollView.contentSize.height;
            let diffHeight = contentHeight - contentOffset;
            let frameHeight = scrollView.bounds.size.height;
            var triggerThreshold  = Float((diffHeight - frameHeight))/Float(threshold);
            triggerThreshold   =  min(triggerThreshold, 0.0)
            let pullRatio  = min(abs(triggerThreshold),1.0);
            self.footerView?.setTransform(inTransform: CGAffineTransform.identity, scaleFactor: CGFloat(pullRatio))
            if pullRatio >= 1 {
                
                self.footerView?.animateFinal()
            }
            
        
        // print("pullRation:\(pullRatio)")
        
        
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        let contentOffset = scrollView.contentOffset.y;
        let contentHeight = scrollView.contentSize.height;
        let diffHeight = contentHeight - contentOffset;
        let frameHeight = scrollView.bounds.size.height;
        let pullHeight  = abs(diffHeight - frameHeight);
        
        
        
        print("pullHeight:\(pullHeight)");
        
        
        
        
        if (self.footerView?.isAnimatingFinal)! {
            print("load more trigger")
            self.isDataLoading = true
            self.footerView?.startAnimate()
            if #available(iOS 10.0, *) {
                print("InThisCaseVersion")
                Timer.scheduledTimer(withTimeInterval: 1, repeats: false, block: { (timer:Timer) in
//                    self.pageNumber += 1
//                    self.params["page"] = self.pageNumber
//                    if self.type != 5 {
//                        self.startNetworking(params: self.params, loadMore: true, type: self.typeFlag, brand_id: self.brID)
//                    }
//
//                    let preferredLanguage = Locale.preferredLanguages[0] as NSString
//                    print(preferredLanguage)
//
//
                    self.loadMoreReciters()
                    
                    self.isDataLoading = false
                    
                })
            } else {
                // Fallback on earlier versions
                print("OldVersionsss")
                
                DispatchQueue.main.async {
                    self.loadMoreReciters()

                    
                    self.isDataLoading = false
                }
                
                
            }
            
        }
        
        
        
        
        
    }
}
