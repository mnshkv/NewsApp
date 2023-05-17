//
//  BookmarkTableViewCell.swift
//  NewsApp
//
//  Created by Келлер Дмитрий on 17.05.2023.
//

import UIKit

class BookmarkTableViewCell: UITableViewCell {
    
    var bookmark: BookmarkDTO?
    
    // MARK: - Properties
    private let photoImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = 8
        imageView.layer.masksToBounds = true
        imageView.image = UIImage(systemName: "book")
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private let nameBookmarkLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 16, weight: .bold)
        label.numberOfLines = 1
        label.text = "UI/UX Design"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.numberOfLines = 3
        label.text = "A simple trick for creating color palletes quickly."
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    // MARK: - Initializers
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setupHierarchy()
        setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public func setup(bookmark: BookmarkDTO) {
        self.bookmark = bookmark
        setupHierarchy()
        setupLayout()
    }
        
    // MARK: - Setup
    private func setupHierarchy() {
        contentView.addSubview(photoImageView)
        contentView.addSubview(nameBookmarkLabel)
        contentView.addSubview(detailLabel)
    }
    
    private func setupLayout() {
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(8)
            make.left.equalTo(contentView).offset(16)
            make.bottom.equalTo(contentView).offset(-8)
            make.width.equalTo(80)
        }
        
        nameBookmarkLabel.text = bookmark?.article.title
        nameBookmarkLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(8)
            make.left.equalTo(photoImageView.snp.right).offset(16)
            make.right.equalTo(contentView).offset(-16)
        }
        
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(nameBookmarkLabel.snp.bottom).offset(8)
            make.left.equalTo(photoImageView.snp.right).offset(16)
            make.right.equalTo(contentView).offset(-16)
            make.bottom.equalTo(contentView).offset(-8)
        }
    }
}

