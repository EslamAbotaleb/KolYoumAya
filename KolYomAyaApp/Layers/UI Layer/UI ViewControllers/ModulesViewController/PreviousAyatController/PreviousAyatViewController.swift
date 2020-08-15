//
//  PreviousAyatViewController.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/24/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit

class PreviousAyatViewController: BaseViewController {
    var isDataLoading:Bool=false
    var previousAyaListModel: PreviousAyatListViewModel?
    var pageNumber: Int = 1
    var previousAyaModel: PreviousAyatModel?
    var coordinator: DetailAyaCoordiantor?
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initializeNavigationBarAppearanceWithBack(viewController: HomeViewController(), titleHeader: "كل يوم آية")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        coordinator = DetailAyaCoordiantor(viewController: self)
        
        previousAyaListModel = PreviousAyatListViewModel()
        
        previousAyaListModel?.registTableViewCell(nibName: "PreviousAyatTableViewCell", tableView: tableView)
        previousAyaListModel?.getPreviousAyaApi(pageNumber: pageNumber, completionHandler: { (previousAya) in
            //            self.previousAyaModel = previousAya
            if self.previousAyaModel?.ayaObject != nil {
                self.previousAyaModel?.ayaObject.append(contentsOf: previousAya.ayaObject)
                
            } else {
                self.previousAyaModel = previousAya
                
            }
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
    }
    
    func loadMoreAya() {
        self.pageNumber += 1
        previousAyaListModel?.getPreviousAyaApi(pageNumber: pageNumber, completionHandler: { (previousAya) in
            self.previousAyaModel?.ayaObject.append(contentsOf: previousAya.ayaObject)
            
            //            self.previousAyaModel = previousAya
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    
}
