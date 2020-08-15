//
//  ElsharawyMediaProgramIdViewController.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/26/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit

class ElsharawyMediaProgramIdViewController: BaseViewController {
    var delegateElsharawyProgramId: DelegateElsharawayMediaSelect?
    @IBOutlet weak var tableView: UITableView!
    var viewModel: ElsharawyMediaProgramIdViewModel?
    var elsharawyMediaModel: ElsharawyMediaProgramIDModel?
    var coordinator: DetailMediaProgramSelectedCoordinator?
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.initializeNavigationBarAppearanceWithBack(viewController: ElsharawyViewController(), titleHeader: delegateElsharawyProgramId?.programName ?? "كل يوم آية")
    }
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        viewModel = ElsharawyMediaProgramIdViewModel()
        coordinator = DetailMediaProgramSelectedCoordinator(viewController: self)
        viewModel?.registTableViewCell(nibName: "ElsharawyMediaProgramIdTableViewCell", tableView: tableView)
     
        viewModel?.getElsharawyMediaProgram(programId: delegateElsharawyProgramId?.programId ?? 0, completionHandler: { (elsharawyMediaProgramIDModel) in
            self.elsharawyMediaModel = elsharawyMediaProgramIDModel
            self.tableView.reloadData()
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
