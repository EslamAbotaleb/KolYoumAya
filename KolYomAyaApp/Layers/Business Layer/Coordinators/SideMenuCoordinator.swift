//
//  SideMenuCoordinator.swift
//  KolYoumAya
//
//  Created by Islam Abotaleb on 7/21/20.
//  Copyright © 2020 Islam Abotaleb. All rights reserved.
//

import UIKit
final class SideMenuCoordinator: Coordinator {
    var childCoordinators: [Coordinator] = []
    
    func start() {
        
    }
    
      func registtableViewCell(nibName name: String, tableView: UITableView) {
          let nib = UINib(nibName: name, bundle: nil)
          tableView.register(nib, forCellReuseIdentifier: SideMenuCell.reuseIdentifier)
      }
      
   
}
