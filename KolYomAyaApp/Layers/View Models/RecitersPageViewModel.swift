//
//  RecitersPageViewModel.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/27/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
import Moya

final class RecitersPageListViewModel {
    let reciterService = MoyaProvider<ApiService>()
    var reciterModel: ReciterModel?
    
    
    func getReciters(pageNumber: Int, completionHandler: @escaping(ReciterModel) -> ()) {
        reciterService.request(.recitersPage(page: pageNumber)) { [weak self] (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    let reciterModel = try! JSONDecoder().decode(ReciterModel.self, from: response.data)
                    
//                    self.reciterModel = reciterModel
                    if self?.reciterModel?.results != nil {
                                 self?.reciterModel?.results.append(contentsOf: reciterModel.results)
                             } else {
                                 self?.reciterModel = reciterModel
                             }
                    completionHandler((self?.reciterModel)!)
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func numberOfRows() -> Int {
        return reciterModel?.results.count ?? 0
    }
    func registerCollectionViewCell(nibName name: String, collectionView: UICollectionView) {
        let nib = UINib(nibName: name, bundle: nil)
        collectionView.register(nib, forCellWithReuseIdentifier: QuarnListenCollectionViewCell.reuseIdentifier)
    }
}
