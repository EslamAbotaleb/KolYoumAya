//
//  DetailAyaSelectedCoordinator.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/24/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
final class DetailAyaCoordiantor: Coordinator {
  private(set)  var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var viewModel: AyaObjectViewModel?
    private var viewController: UIViewController?
    func didFinish() {
        parentCoordinator?.childDidFinish?(self)
    }
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func start() {
        let viewController = DetailAyaViewController.init(nibName: "DetailAyaViewController", bundle: nil)
        viewController.viewModel = viewModel
        let detailAyaCoordinator = DetailAyaCoordiantor(viewController: viewController)
        childCoordinators.append(detailAyaCoordinator)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        appDelegate.window?.rootViewController = navigationController
    }
    
    
}
