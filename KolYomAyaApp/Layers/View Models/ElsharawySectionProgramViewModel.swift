//
//  ElsharawySectionProgramViewModel.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/26/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
import Moya
final class ElsharawySectionProgramViewModel {
    let elsharawyProgramService = MoyaProvider<ApiService>()
    var elsharawyProgramsModel: ElsharawyProgramModel?
    func getProgramsElsharawySection(completionHandler: @escaping(ElsharawyProgramModel) -> ()) {
        elsharawyProgramService.request(.elsharawySection(id: 1)) { (result) in
            switch result {
            case .success(let response):
                DispatchQueue.main.async {
                    let elsharawyProgramModel = try! JSONDecoder().decode(ElsharawyProgramModel.self, from: response.data)
                    self.elsharawyProgramsModel = elsharawyProgramModel
                    completionHandler(self.elsharawyProgramsModel!)
                }
                break
            case .failure(let error):
                print(error)
                break
            }
        }
    }
    
    func numberOfRows() -> Int {
        return self.elsharawyProgramsModel?.programsList.count ?? 0
    }
    
    func registTableViewCell(nibName: String, tableView: UITableView) {
        let nib = UINib(nibName: nibName, bundle: nil)
        tableView.register(nib, forCellReuseIdentifier: ElsharawyTableViewCell.reuseIdentifier)
    }
}
