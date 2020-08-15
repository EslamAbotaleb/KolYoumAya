//
//  PreviousAyatCoordiator.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/24/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
final class PreviousAyatCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    var viewModel: AyaObjectViewModel?
    private var viewController: UIViewController?
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    func didFinish() {
        parentCoordinator?.childDidFinish?(self)
    }
    
    func start() {
        let viewController = PreviousAyatViewController.init(nibName: "PreviousAyatViewController", bundle: nil)
        let previousAyaCoordinator = PreviousAyatCoordinator(viewController: viewController)
        childCoordinators.append(previousAyaCoordinator)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        appDelegate.window?.rootViewController = navigationController
    }
    
    
}
