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
    
    private lazy var infoLabel: UILabel = {
        let label = UILabel()
        label.text = "You haven't saved any articles yet. Start reading and bookmarking them now"
        label.font = .interMedium(16)
        label.textColor = UIColor(red: 124/255, green: 130/255, blue: 161/255, alpha: 1)
        label.textAlignment = .center
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var tableView: UITableView = {
        let tableView = UITableView(frame: .zero, style: .grouped)
        tableView.register(BookmarkCell.self, forCellReuseIdentifier: "bookmarkCell")
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
        } else {
            view.addSubview(infoLabel)
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
        } else {
            NSLayoutConstraint.activate([
                infoLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                infoLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor)
            ])
        }
    }
}

extension BookmarksViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bookmarks.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "bookmarkCell", for: indexPath)
        guard let cell = cell as? BookmarkCell else { return UITableViewCell() }
        let bookmark = bookmarks[indexPath.row]
        cell.setup(bookmark: bookmark)
        return cell
    }
}
