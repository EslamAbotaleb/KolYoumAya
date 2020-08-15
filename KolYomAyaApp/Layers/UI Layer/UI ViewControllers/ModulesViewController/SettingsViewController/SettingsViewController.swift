//
//  SettingsViewController.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 8/13/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit

protocol DelegateForNamereciterProtocol {
    var getNameReciter: String? {get set}
}
class SettingsViewController: BaseViewController {

    @IBOutlet weak var namereciterLabel: UILabel!
    @IBOutlet weak var rectiterName: UIStackView!
    @IBOutlet weak var closeButton: UIButton!
    @IBOutlet weak var nameRecitersTableView: UITableView!
    @IBOutlet weak var viewSelectReciter: UIView!
    var delegate: DelegateForNamereciterProtocol?
    let reader_values = Bundle.main.infoDictionary!["reader_entries"] as! NSArray
    let reader_Names = Bundle.main.infoDictionary!["reader_values"] as! NSArray

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initializeNavigationBarAppearanceWithBack(viewController: HomeViewController(), titleHeader: "الاعدادات")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        let nib = UINib(nibName: "NameRecitersTableViewCell", bundle: nil)
        self.nameRecitersTableView.register(nib, forCellReuseIdentifier: NameRecitersTableViewCell.reuseIdentifier)
        
        if UserDefaults.standard.value(forKey: "getNameReciterForSeetings") as? String != nil {
            self.namereciterLabel.text = UserDefaults.standard.value(forKey: "getNameReciterForSeetings") as? String

        } else {
            self.namereciterLabel.text = reader_values[0] as? String

        }
        delegate?.getNameReciter = self.namereciterLabel.text
        let tap = UITapGestureRecognizer(target: self, action: #selector(stackViewTapped))
        rectiterName.addGestureRecognizer(tap)
        self.closeButton.addTarget(self, action: #selector(closeViewAfterSelectNamereciter), for: .touchUpInside)
        
    }
    @objc func stackViewTapped() {
        print("Tapped")
        self.viewSelectReciter.isHidden = false
    }
    
    @objc func closeViewAfterSelectNamereciter(_ sender: UIButton) {
        
        self.viewSelectReciter.isHidden = true
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

