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
    var bookmarks: [BookmarkDTO] = []
    
    
    // MARK: - Outlets
    private lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.text = "Saved articles to the library"
        label.font = .interMedium(16)
        label.textColor = UIColor(red: 124/255, green: 130/255, blue: 161/255, alpha: 1)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(BookmarkTableViewCell.self, forCellReuseIdentifier: "boommarksCell")
        tableView.dataSource = self
        return tableView
    } ()
    
    
    
    // MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupHierarchy()
        setupLayout()
        
        // Do any additional setup after loading the view.
        bookmarkService.fetchBookmarks { bookmarks in
            self.bookmarks = bookmarks
            self.tableView.reloadData()
            self.setupHierarchy()
            self.setupLayout()
        }
    }

    private func setupHierarchy() {
        if (!bookmarks.isEmpty) {
            view.addSubview(tableView)
        }
        view.addSubview(subtitleLabel)
    }
    
    private func setupLayout() {
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(16)
            make.leading.equalTo(view.snp.leading).offset(16)
            make.trailing.equalTo(view.snp.trailing).offset(-16)
        }
        if (!bookmarks.isEmpty) {
            tableView.snp.makeConstraints { make in
                make.top.equalTo(subtitleLabel.snp.bottom).offset(30)
                make.right.equalTo(view.snp.right)
                make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
                make.left.equalTo(view.snp.left)
            }
        }
    }
}

extension BookmarksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let bookmark = bookmarks[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "boommarksCell", for: indexPath) as! BookmarkTableViewCell
        cell.setup(bookmark: bookmark)
        return cell
    }
}
