//
//  CategoriesCoordinator.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 10.05.2023.
//

import Foundation
import UIKit

class CategoriesCoordinator: Coordinator {
    var navigationController: UINavigationController = UINavigationController()
    
    init() {
        let mainVC = CategoriesViewController()
        mainVC.navigationItem.title = "Categories"
        navigationController.tabBarItem.image = UIImage(systemName: "square.grid.2x2")
        navigationController.pushViewController(mainVC, animated: false)
    }
    
    func start() {
        
    }
}
