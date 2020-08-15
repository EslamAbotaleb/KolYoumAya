//
//  Extension + TableView.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/24/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit

extension PreviousAyatViewController: UITableViewDelegate, UITableViewDataSource {
   
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (previousAyaListModel?.numberOfRows())!
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PreviousAyatTableViewCell.reuseIdentifier, for: indexPath) as? PreviousAyatTableViewCell else {
            fatalError("Cannot found Previous Aya Cell")
        }
        cell.configure(viewModel: (previousAyaModel?.ayaObject[indexPath.row])!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 105.0
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let viewModel = self.previousAyaModel?.ayaObject
        coordinator!.viewModel = viewModel![indexPath.row]
        coordinator?.start()
    }
}
