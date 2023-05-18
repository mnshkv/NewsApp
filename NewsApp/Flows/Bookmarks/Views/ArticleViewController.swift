//
//  ArticleViewController.swift
//  NewsApp
//
//  Created by Келлер Дмитрий on 18.05.2023.
//

import UIKit
import SnapKit

final class ArticleViewController: UIViewController {

    var bookmark: BookmarkDTO?
    
    private lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let titleLabel: UILabel = {
        let label = UILabel()
        label.font = .interMedium(20)
        label.textColor = .white
        label.numberOfLines = 3
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let resultsLabel: UILabel = {
        let label = UILabel()
        label.font = .interMedium(14)
        label.textColor = .blackPrimary
        label.numberOfLines = 1
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let contentLabel: UILabel = {
        let label = UILabel()
        label.font = .interMedium(16)
        label.textColor = .darkGray
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK:- LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        setupHierarchy()
        setupLayout()
        imageView.sd_setImage(with: URL(string: bookmark?.article.urlToImage ?? "book"), completed: nil)
    }
    

    // MARK: - Setup
    
    public func setup(bookmark: BookmarkDTO) {
        self.bookmark = bookmark
        imageView.sd_setImage(with: URL(string: bookmark.article.urlToImage ?? "book"), completed: nil)
        titleLabel.text = bookmark.article.title
        contentLabel.text = bookmark.article.content
        setupHierarchy()
        setupLayout()
    }
    
    private func setupHierarchy() {
      view.addSubview(imageView)
      view.addSubview(titleLabel)
      view.addSubview(contentLabel)
    }
    
    private func setupLayout() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(0)
            make.leading.equalTo(view.snp.leading).offset(0)
            make.trailing.equalTo(view.snp.trailing).offset(0)
        }
        
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.top).offset(216)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-19)
            make.bottom.equalTo(imageView.snp.bottom).offset(-112)
        }
        
        contentLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(56)
            make.leading.equalTo(view.snp.leading).offset(20)
            make.trailing.equalTo(view.snp.trailing).offset(-19)
            make.bottom.equalTo(view).offset(-8)
        }
    }
}
