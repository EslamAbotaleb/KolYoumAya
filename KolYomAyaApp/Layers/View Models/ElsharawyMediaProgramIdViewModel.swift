//
//  ElsharawyMediaProgramIdViewModel.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/26/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
import Moya
final class ElsharawyMediaProgramIdViewModel {
    let elsharawyMediaService = MoyaProvider<ApiService>()
    var elsharawyMediaModel: ElsharawyMediaProgramIDModel?
    func getElsharawyMediaProgram(programId: Int, completionHandler: @escaping(ElsharawyMediaProgramIDModel) -> ()) {
        elsharawyMediaService.request(.mediaProgramElsharawy(program_id: programId)) { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    let elsharawyMediaObject = try!  JSONDecoder().decode(ElsharawyMediaProgramIDModel.self, from: response.data)
                    
                    self.elsharawyMediaModel = elsharawyMediaObject
                    completionHandler(self.elsharawyMediaModel!)
                }
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    func numberOfRows() -> Int {
        return self.elsharawyMediaModel?.mediaList?.count ?? 0
    }
    
       func registTableViewCell(nibName: String, tableView: UITableView) {
           let nib = UINib(nibName: nibName, bundle: nil)
           tableView.register(nib, forCellReuseIdentifier: ElsharawyMediaProgramIdTableViewCell.reuseIdentifier)
       }
}
