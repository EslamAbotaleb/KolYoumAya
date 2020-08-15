//
//  ElsharawyMediaProgramIdCoordinator.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/26/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
final class ElsharawyMediaProgramIdCoordinator: Coordinator, DelegateElsharawayMediaSelect {
   
    var programId: Int?
    var programName: String?
    var parentCoordinator: Coordinator?
    private var viewController: UIViewController?
    private(set) var childCoordinators: [Coordinator] = []
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    func didFinish() {
        parentCoordinator?.childDidFinish?(self)
    }
    
    func start() {
        let viewController = ElsharawyMediaProgramIdViewController.init(nibName: "ElsharawyMediaProgramIdViewController", bundle: nil)
        viewController.delegateElsharawyProgramId = self
        viewController.delegateElsharawyProgramId?.programId = programId
        viewController.delegateElsharawyProgramId?.programName = programName
        let elsharawyMediaProgramIdCoordinator = ElsharawyMediaProgramIdCoordinator(viewController: viewController)
        childCoordinators.append(elsharawyMediaProgramIdCoordinator)
        let navigationController = UINavigationController(rootViewController: viewController)
        appDelegate.window?.rootViewController = navigationController
    }
    
    
    
}
