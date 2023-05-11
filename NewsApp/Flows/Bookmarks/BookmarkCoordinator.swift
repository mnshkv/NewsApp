//
//  BookmarkCoordinator.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 10.05.2023.
//

import Foundation
import UIKit

class BookmarkCoordinator: Coordinator {
    var navigationController: UINavigationController = UINavigationController()
    
    init() {
        let mainVC = BookmarksViewController()
        mainVC.navigationItem.title = "Bookmarks"
        navigationController.tabBarItem.image = UIImage(systemName: "bookmark")
        navigationController.pushViewController(mainVC, animated: false)
    }
    
    func start() {
        
    }
}
