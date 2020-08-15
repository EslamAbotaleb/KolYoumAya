//
//  TafserBookViewModel.swift
//  KolYoumAya
//
//  Created by Islam Abotaleb on 7/23/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
import Moya

final class TafserBookViewModel {
    
    let tafserBooksService = MoyaProvider<ApiService>()
    var tafserModel: BooksTafserViewModel?
    var resultModel: [Result] = []
    
    func getTafserBooksApi(completionHandler: @escaping ([Result]) -> ()) {
        tafserBooksService.request(.tafserBooks(page: 1)) { (result) in
            switch (result) {
            
            case .success(let response):
                DispatchQueue.main.async {
                    let tafserBookModel = try! JSONDecoder().decode(BooksTafserViewModel.self, from: response.data)
                    
                    self.resultModel = tafserBookModel.results!
                    completionHandler(tafserBookModel.results!)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    func numberOfRows() -> Int {
        return  resultModel.count
    }
    func registCollectionViewCell(nibName name: String, collectionView: UICollectionView) {
        let nib = UINib(nibName: name, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: TafserBookCollectionViewCell.reuseIdentifier)
    }
}
