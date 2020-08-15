//
//  AlbumReciterViewController.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/27/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
protocol DelegateAudioListProtocol {
    var audioListReciter: [AudioList]? {get set}
    var nameReciter: String? {get set}
    var imageReciter: String? {get set}

}
class AlbumReciterViewController: BaseViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var delgateQuarnListenProtcol: DelegateQuarnListenProtcol?
    var viewModel: AlbumReciterViewModel?
    var albumReciterModel: AlbumReciterModel?
    var coordinator: ListAyatSpesficReciterCooridnator?
    var headerView: HeaderView = {
        let nib = UINib(nibName: "HeaderView", bundle: nil)
        return nib.instantiate(withOwner: self, options: nil).first as! HeaderView
    }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.initializeNavigationBarAppearanceWithBack(viewController: QuarnListenViewController(), titleHeader: "القران الكريم (استماع)")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = AlbumReciterViewModel()
        coordinator = ListAyatSpesficReciterCooridnator(viewController: self)
        viewModel?.registTableViewCell(nibName: "AlbumReciterTableViewCell", tableView: tableView)
        
        viewModel?.getAlbumReciter(page: 1, reciterID: delgateQuarnListenProtcol?.reciterId ?? 0, completionHandler: { (albumReciterObjectModel) in
            self.albumReciterModel = albumReciterObjectModel
            self.headerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
                       self.headerView.imageView.makeRounded()
            self.headerView.imageView.imageFromURL(urlString: (self.delgateQuarnListenProtcol?.imageReciter!)!)
            
            self.headerView.titleLabel.text = self.delgateQuarnListenProtcol?.nameReciter
                             self.headerView.scrollView = self.tableView
                             self.headerView.frame = CGRect(
                                 x: 0,
                                 y: self.tableView.safeAreaInsets.top,
                                 width: self.view.frame.width,
                                 height: 250)

                             self.tableView.backgroundView = UIView()
                             self.tableView.backgroundView?.addSubview(self.headerView)
                             self.tableView.contentInset = UIEdgeInsets(
                                 top: 200,
                                 left: 0,
                                 bottom: 0,
                                 right: 0)
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        })
    }
    override func viewSafeAreaInsetsDidChange() {
              super.viewSafeAreaInsetsDidChange()

              tableView.contentInset = UIEdgeInsets(top: 250 + tableView.safeAreaInsets.top,
                                                    left: 0,
                                                    bottom: 0,
                                                    right: 0)
              headerView.updatePosition()
          }
          
          override func viewWillLayoutSubviews() {
              super.viewWillLayoutSubviews()
              
              headerView.updatePosition()
          }
          
          // MARK: - UIScrollViewDelegate methods

           func scrollViewDidScroll(_ scrollView: UIScrollView) {
              headerView.updatePosition()
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
