//
//  BookmarkCell.swift
//  NewsApp
//
//  Created by Келлер Дмитрий on 17.05.2023.
//

import UIKit

class BookmarkCell: UITableViewCell {
    
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
    
    private let titleBookmarkLabel: UILabel = {
        let label = UILabel()
        label.font = .interMedium(14)
        label.numberOfLines = 1
        label.text = "UI/UX Design"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private let detailLabel: UILabel = {
        let label = UILabel()
        label.font = .interRegular(16)
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
        contentView.addSubview(titleBookmarkLabel)
        contentView.addSubview(detailLabel)
    }
    
    private func setupLayout() {
        //photoImageView.image = UIImage(named: bookmark?.article.urlToImage ??  "book")
        photoImageView.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(8)
            make.left.equalTo(contentView).offset(16)
            make.bottom.equalTo(contentView).offset(-8)
            make.width.equalTo(80)
        }
        
        titleBookmarkLabel.text = bookmark?.article.title
        titleBookmarkLabel.snp.makeConstraints { make in
            make.top.equalTo(contentView).offset(8)
            make.left.equalTo(photoImageView.snp.right).offset(16)
            make.right.equalTo(contentView).offset(-16)
        }
        detailLabel.text = bookmark?.article.description
        detailLabel.snp.makeConstraints { make in
            make.top.equalTo(titleBookmarkLabel.snp.bottom).offset(8)
            make.left.equalTo(photoImageView.snp.right).offset(16)
            make.right.equalTo(contentView).offset(-16)
            make.bottom.equalTo(contentView).offset(-8)
        }
    }
}

