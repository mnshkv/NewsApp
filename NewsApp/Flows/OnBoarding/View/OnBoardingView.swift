//
//  OnBoardingView.swift
//  NewsApp
//
//  Created by Луиза Самойленко on 12.05.2023.
//

import UIKit
import SnapKit

class OnBoardingPageView: UIView {
    lazy var pageCards: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFill
        imageView.image = .firstCard
        imageView.layer.masksToBounds = true
        imageView.layer.cornerRadius = 12
        return imageView
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .blackPrimary
        label.numberOfLines = 1
        label.font = .interSemiBold(24)
        label.textAlignment = .center
//        label.setContentHuggingPriority(.required, for: .vertical)
        return label
    }()

    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.textColor = .grayPrimary
        label.numberOfLines = 2
        label.font = .interRegular(16)
        label.textAlignment = .center
//        label.setContentHuggingPriority(.defaultLow, for: .vertical)
        return label
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        setupConstraints()
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        setupConstraints()
    }

    func configure(onboarding: OnBoardingPage) {
        pageCards.image = UIImage(named: onboarding.cardName)
        titleLabel.text = onboarding.title
        subtitleLabel.text = onboarding.subtitle
    }

    private func setupConstraints() {
        addSubview(pageCards)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        pageCards.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(0)
            make.width.equalTo(288)
            make.height.equalTo(336)
            make.centerX.equalToSuperview()
        }
        titleLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(pageCards.snp.bottom).inset(-82)
        }
        subtitleLabel.snp.makeConstraints { make in
            make.left.right.equalToSuperview().inset(16)
            make.top.equalTo(titleLabel.snp.bottom).inset(-24)
            make.bottom.equalToSuperview()
        }
    }
}
