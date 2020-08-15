//
//  AlbumReciterTableView + Extension.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/27/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
extension AlbumReciterViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel?.numberOfRows() ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: AlbumReciterTableViewCell.reuseIdentifier, for: indexPath) as? AlbumReciterTableViewCell else {
            fatalError("AlbumReciter cell not found")
        }
        cell.configure(viewModel: (self.albumReciterModel?.results?[indexPath.row])!)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 70.0
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //MARK:- will pass audioList spesfic reciter
        coordinator?.audioListReciter = self.albumReciterModel?.results?[indexPath.row].audioList
        coordinator?.nameReciter = self.albumReciterModel?.results?[indexPath.row].name
        coordinator?.imageReciter = self.delgateQuarnListenProtcol?.imageReciter
        //MARK:- start to audiolist coordinator
        coordinator?.start()
    }
}
