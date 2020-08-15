//
//  PreivousAyatListViewModel.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/24/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
import Moya

final class PreviousAyatListViewModel {
    let previousAyatService = MoyaProvider<ApiService>()
    var previousAyaModel: PreviousAyatModel?

    func getPreviousAyaApi(pageNumber: Int,completionHandler: @escaping (PreviousAyatModel) -> ()) {
        previousAyatService.request(.previousAya(page: pageNumber)) { [weak self] (result) in
            switch (result) {
            case .success(let response):
                DispatchQueue.main.async {
                    let previousAyaModel = try!
                    JSONDecoder()
                        .decode(PreviousAyatModel.self, from: response.data)
//                    self?.previousAyaModel = previousAyaModel
//                    self?.previousAyaModel?.ayaObject.append(contentsOf: previousAyaModel.ayaObject)

                    
                    if self?.previousAyaModel?.ayaObject != nil {
self?.previousAyaModel?.ayaObject.append(contentsOf: previousAyaModel.ayaObject)
                              } else {
                        self?.previousAyaModel = previousAyaModel

                              }
//                    self?.previousAyaModel?.ayaObject = previousAyaModel.ayaObject
                    completionHandler(previousAyaModel)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func numberOfRows() -> Int {
        return previousAyaModel?.ayaObject.count ?? 0
    }
    
    func registTableViewCell(nibName name: String, tableView: UITableView) {
         let nib = UINib(nibName: name, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: PreviousAyatTableViewCell.reuseIdentifier)
     }
    
   
    
    
}
