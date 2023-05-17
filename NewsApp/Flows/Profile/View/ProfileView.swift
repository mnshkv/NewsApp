//
//  ProfileView.swift
//  NewsApp
//
//  Created by VASILY IKONNIKOV on 17.05.2023.
//

import UIKit
import SnapKit

final class ProfileView: UIView {
	
	// MARK: - Views
	
	private lazy var profilePhoto: UIImageView = {
		let imageView = UIImageView()
		imageView.image = UIImage(named: "profilePhoto")
		imageView.clipsToBounds = true
		imageView.layer.cornerRadius = 72 / 2
		return imageView
	}()
	
	private let nameLabel = UILabel(textColor: UIColor.blackPrimary ?? .black, fontSize: 16, weight: .bold)
	private let emailLabel = UILabel(textColor: UIColor.grayPrimary ?? .gray, fontSize: 14)

	private let stackView = UIStackView(axis: .horizontal, alignment: .center, distribution: .fill, spacing: 24)
	private let nameStackView = UIStackView(axis: .vertical, alignment: .fill, distribution: .fillEqually)
	
	// MARK: - Init
	
	override init(frame: CGRect) {
		super.init(frame: frame)
		addSubviews()
		setupConstraints()
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
}

// MARK: - Layout

private extension ProfileView {
	func addSubviews() {
		addSubview(stackView)
		stackView.addArrangedSubview(profilePhoto)
		stackView.addArrangedSubview(nameStackView)
		nameStackView.addArrangedSubview(nameLabel)
		nameStackView.addArrangedSubview(emailLabel)
	}
	
	func setupConstraints() {
		stackView.snp.makeConstraints { make in
			make.left.equalTo(self)
			make.right.equalTo(self)
			make.top.equalTo(self)
			make.bottom.equalTo(self)
		}
		
		profilePhoto.snp.makeConstraints { make in
			make.height.equalTo(72)
			make.width.equalTo(72)
		}
	}
}

