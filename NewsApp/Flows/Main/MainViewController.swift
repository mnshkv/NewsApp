//
//  MainViewController.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 10.05.2023.
//

import UIKit

class MainViewController: UIViewController {
    
    let newsService = NewsService()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .systemBackground
        
        newsService.fetchNews { data in
            print("look this \(data.articles.count)")
            
//            if let uid = AuthService.shared.uid {
//                BookmarkService().addBookmark(.init(article: data.articles.last!, userId: uid))
//            }
        }
    }
}
