//
//  MainCoordinator.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 10.05.2023.
//

import Foundation
import UIKit

class MainCoordinator: Coordinator {
    var navigationController: UINavigationController = UINavigationController()
    
    init() {
        let mainVC = MainViewController()
        mainVC.navigationItem.title = "Browse"
        navigationController.tabBarItem.image = UIImage(systemName: "house")
        navigationController.pushViewController(mainVC, animated: false)
    }
    
    func start() {
        
    }
}
