//
//  ElsharawyViewController.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/26/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
protocol DelegateElsharawayMediaSelect {
    var programId: Int? { get set }
    var programName: String? { get set }

}

class ElsharawyViewController: BaseViewController, UIScrollViewDelegate {
    
    var coordinator: ElsharawyMediaProgramIdCoordinator?
    var viewModel: ElsharawySectionProgramViewModel?
    var elsharawyProgramModel: ElsharawyProgramModel?
    @IBOutlet weak var tableView: UITableView!

    var headerView: HeaderView = {
           let nib = UINib(nibName: "HeaderView", bundle: nil)
           return nib.instantiate(withOwner: self, options: nil).first as! HeaderView
       }()
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initializeNavigationBarAppearanceWithBack(viewController: HomeViewController(), titleHeader: "كل يوم آية")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       
        viewModel = ElsharawySectionProgramViewModel()
        coordinator = ElsharawyMediaProgramIdCoordinator(viewController: self)
           viewModel?.registTableViewCell(nibName: "ElsharawyTableViewCell", tableView: tableView)
        
        viewModel?.getProgramsElsharawySection(completionHandler: { (elsharawyProgramModel) in
            self.elsharawyProgramModel = elsharawyProgramModel
            self.headerView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
            self.headerView.imageView.makeRounded()
            self.headerView.imageView.imageFromURL(urlString: self.elsharawyProgramModel!.sectionImage)
            self.headerView.titleLabel.text = self.elsharawyProgramModel?.longName
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
            
//            self.sectionImage.imageFromURL(urlString: self.elsharawyProgramModel!.sectionImage)
//            self.titleElsharayLabel.text = self.elsharawyProgramModel?.longName
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
