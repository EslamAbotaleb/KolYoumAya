//
//  TafserBookViewController.swift
//  KolYoumAya
//
//  Created by Islam Abotaleb on 7/23/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
import Moya
class TafserBookViewController: BaseViewController, DelegateDetailTafserBookSelect {
    var numberOfPages: Int?
    
    var bookId: Int?
    
    var bookName: String?
    @IBOutlet weak var collectionView: UICollectionView!
    var coordinator: DetailTafserBookSelectCoordinator?
    var estimateWidth = 160.0
    var viewModel = TafserBookViewModel()
    var tafserBooksModel: [Result] = []
    var cellMarginSize = 5.0
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initializeNavigationBarAppearanceWithBack(viewController: HomeViewController(), titleHeader: "كتب التفسير")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
     
        // Do any additional setup after loading the view.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        coordinator = DetailTafserBookSelectCoordinator(viewController: self)
        viewModel.registCollectionViewCell(nibName: "TafserBookCollectionViewCell", collectionView: collectionView!)
        viewModel.getTafserBooksApi() { resultModel in
            
            self.tafserBooksModel = resultModel
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
            
        }

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
