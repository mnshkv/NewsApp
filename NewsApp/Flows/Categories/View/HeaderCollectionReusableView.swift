//
//  HeaderCollectionReusableView.swift
//  NewsApp
//
//  Created by Луиза Самойленко on 18.05.2023.
//

import UIKit

class HeaderCollectionReusableView: UICollectionReusableView {

    static let reuseId = "HeaderCollectionReusableView"

    private lazy var headerLabel: UILabel = {
        let label = UILabel()
        label.text = "Thousands of articles in each category"
        label.font = .interRegular(16)
        label.textColor = .grayPrimary
        label.textAlignment = .left
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        setupViews()
        setupConstraints()
    }

    private func setupViews() {
        addSubview(headerLabel)
    }

    private func setupConstraints() {
        headerLabel.snp.makeConstraints { make in
            make.centerY.equalToSuperview()
            make.left.right.equalToSuperview()
        }
    }
}
