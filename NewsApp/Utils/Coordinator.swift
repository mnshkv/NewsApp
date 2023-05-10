//
//  Coordinator.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 10.05.2023.
//

import Foundation
import UIKit

protocol Coordinator {
    var navigationController: UINavigationController { get set }
    
    func start()
    
    func push(_ vc: Screens)
    func pop()
}

extension Coordinator {
    func push(_ path: Screens) {
//        navigationController.pushViewController(path.controller, animated: true)
    }
            
    func pop() {
        navigationController.popViewController(animated: true)
    }
}

enum Screens {
    case Main
    case Bookmarks
}

class AppCoordinator {
    public static let shared = AppCoordinator()

//    var navigationController: UINavigationController = UINavigationController()
    var tabController: UITabBarController = UITabBarController()
    
    
    func start() {
        let main = MainCoordinator()
        let bookmarks = BookmarkCoordinator()
        let categories = CategoriesCoordinator()
        let profile = ProfileCoordinator()
        
        tabController.viewControllers = [
            main.navigationController,
            categories.navigationController,
            bookmarks.navigationController,
            profile.navigationController
        ]
        tabController.tabBar.backgroundColor = .systemBackground
    }
    
    func popToRoot() {
//        navigationController.popToRootViewController(animated: true)
    }
}
