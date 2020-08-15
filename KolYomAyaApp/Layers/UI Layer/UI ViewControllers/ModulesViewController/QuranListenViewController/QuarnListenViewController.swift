//
//  QuarnListenViewController.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/27/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
protocol DelegateQuarnListenProtcol {
    var reciterId: Int? { get set }
    var imageReciter: String? {get set }
    var nameReciter: String? { get set }
}

class QuarnListenViewController: BaseViewController {
    var estimateWidth = 160.0
    var cellMarginSize = 5.0
    var isDataLoading: Bool = false
    var pageNumber: Int = 1
    var footerView:CustomFooterView?
    let footerViewReuseIdentifier = "RefreshFooterView"
    var recitersModel: ReciterModel?
    var recitersListViewModel: RecitersPageListViewModel?
    var coordinator: AlbumReciterCoordinator?
    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initializeNavigationBarAppearanceWithBack(viewController: HomeViewController(), titleHeader: "القرآن الكريم (استماع)")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.collectionView.delegate = self
        self.collectionView.dataSource = self
        recitersListViewModel = RecitersPageListViewModel()
        coordinator = AlbumReciterCoordinator(viewController: self)
        recitersListViewModel?.registerCollectionViewCell(nibName: "QuarnListenCollectionViewCell", collectionView: collectionView!)
            self.collectionView.register(UINib(nibName: "CustomFooterView", bundle: nil), forSupplementaryViewOfKind: UICollectionView.elementKindSectionFooter, withReuseIdentifier: footerViewReuseIdentifier)
        recitersListViewModel?.getReciters(pageNumber: pageNumber, completionHandler: { (reciterResult) in
//            self.recitersModel = reciterResult
            if self.recitersModel?.results != nil {
                self.recitersModel?.results.append(contentsOf: reciterResult.results)
            } else {
                self.recitersModel = reciterResult
            }
            DispatchQueue.main.async {
                self.collectionView.reloadData()
            }
        })
        
    }
    
    func loadMoreReciters() {
        self.recitersModel?.results.removeAll()
        self.pageNumber += 1
        recitersListViewModel?.getReciters(pageNumber: pageNumber, completionHandler: { (resultReciter) in
            self.recitersModel?.results.append(contentsOf: resultReciter.results)
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
