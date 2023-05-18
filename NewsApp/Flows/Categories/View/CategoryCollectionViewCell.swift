//
//  CategoryCollectionViewCell.swift
//  NewsApp
//
//  Created by Луиза Самойленко on 17.05.2023.
//

import UIKit
import SnapKit

class CategoryCollectionViewCell: UICollectionViewCell {

    static let reuseId = "CategoryCollectionViewCell"

    private lazy var containerView: UIView = {
        let view = UIView()
        view.layer.borderWidth = 1
        view.layer.borderColor = UIColor.grayLighter?.cgColor
        view.layer.masksToBounds = true
        view.layer.cornerRadius = 12
        return view
    }()

    private lazy var categoryStackview: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 16
        return stackView
    }()

    private lazy var categoryImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .firstCard
        imageView.layer.masksToBounds = true
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()

    private lazy var categoryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "Test"
        label.font = .interSemiBold(16)
        label.textColor = .grayDarker
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }

    private func commonInit() {
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        contentView.addSubview(containerView)
        containerView.addSubview(categoryStackview)
        categoryStackview.addArrangedSubview(categoryImageView)
        categoryStackview.addArrangedSubview(categoryLabel)
    }

    private func setupConstraints() {
        containerView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
        categoryStackview.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.centerY.equalToSuperview()
        }
        categoryImageView.snp.makeConstraints { make in
            make.height.width.equalTo(24)
        }
    }
}
