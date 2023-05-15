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
        navigationController.pushViewController(path.controller, animated: true)
    }
            
    func pop() {
        navigationController.popViewController(animated: true)
    }
}

enum Screens {
    case Main
    case Bookmarks
    case Onboarding
    
    var controller: UIViewController {
        switch self {
        case .Main:
            return MainViewController()
        case .Bookmarks:
            return BookmarksViewController()
        case .Onboarding:
            return OnBoardingViewController()
        }
    }
}

class AppCoordinator {
    public static let shared = AppCoordinator()

    public let main = MainCoordinator()
    public let bookmarks = BookmarkCoordinator()
    public let categories = CategoriesCoordinator()
    public let profile = ProfileCoordinator()
    
    var tabController: UITabBarController = UITabBarController()
    
    func start() {
        tabController.viewControllers = [
            main.navigationController,
            categories.navigationController,
            bookmarks.navigationController,
            profile.navigationController
        ]
        tabController.tabBar.backgroundColor = .systemBackground
    }
    
    private func showFullcoverModal(_ screen: Screens) {
        main.push(screen)
    }
    
    func showOnBoarding() {
        showFullcoverModal(.Onboarding)
    }
}
