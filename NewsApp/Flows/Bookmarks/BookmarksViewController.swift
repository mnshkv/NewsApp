//
//  BookmarksViewController.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 11.05.2023.
//

import UIKit
import SnapKit

class BookmarksViewController: UIViewController {
    
    private let bookmarkService = BookmarkService()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        bookmarkService.fetchBookmarks { bookmarks in
            print("APP: ", bookmarks)
        }
    }


    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboar dSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
