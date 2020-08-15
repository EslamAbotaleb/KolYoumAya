//
//  QuarnListenCoordinator.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/27/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit

final class QuarnListenCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    
    var parentCoordinator: Coordinator?
    var viewModel: ReciterModel?
    private var viewController: UIViewController?
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    func didFinish() {
        parentCoordinator?.childDidFinish?(self)
    }
    func start() {
        let viewController = QuarnListenViewController.init(nibName: "QuarnListenViewController", bundle: nil)
        let quarnListenCoordinator = QuarnListenCoordinator(viewController: viewController)
        childCoordinators.append(quarnListenCoordinator)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        appDelegate.window?.rootViewController = navigationController
    }
}
