//
//  BookGetAllByPageNumber + CollectionView.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/28/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
extension BookGetAllByPageNumberViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel?.numberOfRows() ?? 0
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BookGetAllByPageNumberCollectionViewCell.reuseIdentifier, for: indexPath) as? BookGetAllByPageNumberCollectionViewCell else {
            fatalError("Not found cell called get all books")
        }
        cell.configure(viewModel: (self.viewModel?.getAllBooksModel?.results[indexPath.row])!)
        return cell
    }
}
extension BookGetAllByPageNumberViewController: UICollectionViewDelegateFlowLayout {
   
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
