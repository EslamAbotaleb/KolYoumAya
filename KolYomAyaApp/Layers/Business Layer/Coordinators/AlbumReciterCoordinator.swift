//
//  AlbumReciterCoordinator.swift
//  KolYomAyaApp
//
//  Created by Islam Abotaleb on 7/27/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
final class AlbumReciterCoordinator: Coordinator, DelegateQuarnListenProtcol {
   
    
   private(set) var childCoordinators: [Coordinator] = []
    var viewController: UIViewController?
    var parentCoordinator: Coordinator?
    var reciterId: Int?
    var imageReciter: String?
    var nameReciter: String?
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    func didFinish() {
        parentCoordinator?.childDidFinish?(self)
    }
    
    func start() {
        let viewController = AlbumReciterViewController.init(nibName: "AlbumReciterViewController", bundle: nil)
        viewController.delgateQuarnListenProtcol = self
        viewController.delgateQuarnListenProtcol?.reciterId = reciterId
        viewController.delgateQuarnListenProtcol?.imageReciter = imageReciter
        print("fjkewiofuweofyweiuyweiufyweif\( viewController.delgateQuarnListenProtcol?.imageReciter)")
        viewController.delgateQuarnListenProtcol?.nameReciter = nameReciter
        let albumReciterCoordinator = AlbumReciterCoordinator(viewController: viewController)
        childCoordinators.append(albumReciterCoordinator)
        let navigationController = UINavigationController(rootViewController: viewController)
        appDelegate.window?.rootViewController = navigationController
        
    }
    
    
    
}
