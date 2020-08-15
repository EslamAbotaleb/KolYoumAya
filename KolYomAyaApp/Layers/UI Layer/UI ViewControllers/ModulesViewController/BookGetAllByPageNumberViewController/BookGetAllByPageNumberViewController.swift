//
//  BookGetAllByPageNumberViewController.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/28/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit

class BookGetAllByPageNumberViewController: BaseViewController {
    var estimateWidth = 160.0
    var PageNumber: Int = 1
    var cellMarginSize = 5.0
    var viewModel: GetAllBooksByPageNumberViewModel?
    @IBOutlet weak var collectionView: UICollectionView!
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initializeNavigationBarAppearanceWithBack(viewController: HomeViewController(), titleHeader: "كتب التفسير")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = GetAllBooksByPageNumberViewModel()
        viewModel?.registCollectionViewCell(nibName: "BookGetAllByPageNumberCollectionViewCell", collectionView: collectionView)
        collectionView.delegate = self
        collectionView.dataSource = self
        viewModel?.getAllBooksByPageNumberApi(pageNumber: PageNumber, completionHandler: { (resultBookGetAllbyPageNumber) in
            self.viewModel?.getAllBooksModel = resultBookGetAllbyPageNumber
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
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
