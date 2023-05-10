//
//  ProfileCoordinator.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 10.05.2023.
//

import Foundation
import UIKit

class ProfileCoordinator: Coordinator {
    var navigationController: UINavigationController = UINavigationController()
    
    init() {
        let mainVC = ProfileViewController()
        mainVC.navigationItem.title = "Profile"
        navigationController.tabBarItem.image = UIImage(systemName: "person")
        navigationController.pushViewController(mainVC, animated: false)
    }
    
    func start() {
        
    }
}
