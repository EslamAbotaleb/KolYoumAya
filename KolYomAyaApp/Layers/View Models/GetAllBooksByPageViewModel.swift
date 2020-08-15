//
//  GetAllBooksByPageViewModel.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/28/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
import Moya

final class GetAllBooksByPageNumberViewModel {
   let getAllBooksByPageNumberService = MoyaProvider<ApiService>()
    var getAllBooksModel: BookGetAllbyPageNumber?
    
    func getAllBooksByPageNumberApi(pageNumber: Int,completionHandler: @escaping(BookGetAllbyPageNumber) -> ()) {
        getAllBooksByPageNumberService.request(.getAllBooksPage(page: 1)) { (result) in
            switch(result) {
            case .success(let response):
                DispatchQueue.main.async {
                    let getAllBooksModel = try! JSONDecoder().decode(BookGetAllbyPageNumber.self, from: response.data)
                    
                    self.getAllBooksModel = getAllBooksModel
                    completionHandler(self.getAllBooksModel!)
                }
                break
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfRows() -> Int {
        return self.getAllBooksModel?.results.count ?? 0
    }
    func registCollectionViewCell(nibName name: String, collectionView: UICollectionView) {
           let nib = UINib(nibName: name, bundle: nil)
           collectionView.register(nib, forCellWithReuseIdentifier: BookGetAllByPageNumberCollectionViewCell.reuseIdentifier)
       }
}

