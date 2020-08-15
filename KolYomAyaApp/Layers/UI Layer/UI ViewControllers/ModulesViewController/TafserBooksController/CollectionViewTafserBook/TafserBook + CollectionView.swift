//
//  TafserBook + CollectionView.swift
//  KolYoumAya
//
//  Created by Islam Abotaleb on 7/23/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit

protocol DelegateDetailTafserBookSelect {
    var bookId: Int? { get set }
    var numberOfPages: Int? { get set }
    var bookName: String? { get set }

}

extension TafserBookViewController: UICollectionViewDelegate, UICollectionViewDataSource {
   
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.numberOfRows()

    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: TafserBookCollectionViewCell.reuseIdentifier, for: indexPath) as? TafserBookCollectionViewCell else {
            fatalError("Cannot found tafser book cell")
        }
        cell.configure(viewModel: (tafserBooksModel[indexPath.row]))

        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
      
//
        coordinator?.bookId = tafserBooksModel[indexPath.row].id
        coordinator?.numberOfPages = tafserBooksModel[indexPath.row].numberOfPages
        coordinator?.bookName = tafserBooksModel[indexPath.row].title
        coordinator?.start()
    }
}
extension TafserBookViewController: UICollectionViewDelegateFlowLayout {
   
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = self.calculateWith()
        return CGSize(width: width  , height: width + 30.0)
    }
    func calculateWith() -> CGFloat {
             let estimatedWidth = CGFloat(estimateWidth)
             let cellCount = floor(CGFloat(self.view.frame.size.width / estimatedWidth))
             
             let margin = CGFloat(cellMarginSize * 2)
             let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
             
             return width
         }
       
}
