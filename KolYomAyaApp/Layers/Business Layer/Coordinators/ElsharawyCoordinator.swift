//
//  ElsharawyCoordinator.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/26/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import Foundation
import UIKit
final class ElsharawyCoordinator: Coordinator {
    private(set) var childCoordinators: [Coordinator] = []
    var parentCoordinator: Coordinator?
    private var viewController: UIViewController?
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    func didFinish() {
        parentCoordinator?.childDidFinish?(self)
    }
    
    func start() {
        let viewController = ElsharawyViewController(nibName: "ElsharawyViewController", bundle: nil)
        let elsharawyCoordinator = ElsharawyCoordinator(viewController: viewController)
        childCoordinators.append(elsharawyCoordinator)
        let navigationController = UINavigationController(rootViewController: viewController)
        navigationController.modalPresentationStyle = .fullScreen
        appDelegate.window?.rootViewController = navigationController
    }
}
