//
//  QuraanReadCoordinator.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/28/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
final class QuraanReadCoordinator: Coordinator {
   private(set) var childCoordinators: [Coordinator] = []
    private var viewController: UIViewController?
    var parentCoodinator: Coordinator?
  
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func didFinish() {
        parentCoodinator?.childDidFinish?(self)
    }
    
    func start() {
        let viewController = QuarnReadViewController.init(nibName: "QuarnReadViewController", bundle: nil)
        let quraanReadCoordinator = QuraanReadCoordinator(viewController: viewController)
        childCoordinators.append(quraanReadCoordinator)
        let navigationController = UINavigationController(rootViewController: viewController)
        appDelegate.window?.rootViewController = navigationController
    }
    
    
}
