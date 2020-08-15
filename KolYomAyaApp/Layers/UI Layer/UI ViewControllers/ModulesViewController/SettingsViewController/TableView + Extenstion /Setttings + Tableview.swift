//
//  Setttings + Tableview.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 8/13/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import  UIKit
extension SettingsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = nameRecitersTableView.dequeueReusableCell(withIdentifier: NameRecitersTableViewCell.reuseIdentifier, for: indexPath) as? NameRecitersTableViewCell else {
            return UITableViewCell()
        }
        let readerObject = self.reader_values[indexPath.row] as? String
        cell.nameReciter.text = readerObject
        return cell
    }
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //MARK:- will be add count of readers array
        return self.reader_values.count
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let readerObject = self.reader_Names[indexPath.row] as? String
        let readerValues = self.reader_values[indexPath.row] as? String

        self.namereciterLabel.text = readerValues
//        delegate?.getNameReciter = self.namereciterLabel.text
        UserDefaults.standard.set(readerObject, forKey: "getNameReciter")
        UserDefaults.standard.set(readerValues, forKey: "getNameReciterForSeetings")

        UserDefaults.standard.synchronize()

    }
}
