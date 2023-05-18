//
//  ProfileViewController.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 10.05.2023.
//

import UIKit
import SnapKit

class ProfileViewController: UIViewController {
	
	let profileService = ProfileService()
	
	private let profileView = ProfileView()
	private let languageButton = Button(title: "Language", imageName: UIImage.arrow)
	private let termsButton = Button(title: "Terms & Conditions", imageName: UIImage.arrow)
	private let signOutButton = Button(title: "Sign Out", imageName: UIImage.signOut)
	private let profileStackView = UIStackView(axis: .vertical, alignment: .fill, distribution: .fill, spacing: 44)
	private let buttonStackView = UIStackView(axis: .vertical, alignment: .fill, distribution: .equalSpacing, spacing: 28)
	
	// MARK: - Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		addSubviews()
		setupConstraints()
		setupNavigationBarAppearance()
		addTargetToButtons()
		
		profileService.fetchProfile { profile in
			if let profile = profile {
				print("APP: look on profile \(profile.name)")
			}
		}

	}
}

// MARK: - Action

private extension ProfileViewController {
	
	func addTargetToButtons() {
		languageButton.addTarget(self, action: #selector(languageAction), for: .touchUpInside)
		termsButton.addTarget(self, action: #selector(termAction), for: .touchUpInside)
	}
	
	@objc func termAction() {
		let termVC = TermsAndConditionViewController()
		navigationController?.pushViewController(termVC, animated: true)
	}
	
	@objc func languageAction() {
		let langVC = LanguageViewController()
		navigationController?.pushViewController(langVC, animated: true)
	}
	
}

// MARK: - Layout and Style

private extension ProfileViewController {
	
	func setupView() {
		view.backgroundColor = .systemBackground
	}
	
	func setupNavigationBarAppearance() {
		navigationController?.navigationBar.prefersLargeTitles = true
	}
	
	func addSubviews() {
		view.addSubview(profileStackView)
		view.addSubview(buttonStackView)
		profileStackView.addArrangedSubview(profileView)
		profileStackView.addArrangedSubview(languageButton)
		buttonStackView.addArrangedSubview(termsButton)
		buttonStackView.addArrangedSubview(signOutButton)
	}
	
	func setupConstraints() {
		profileStackView.snp.makeConstraints { make in
			make.top.equalTo(view.safeAreaLayoutGuide).offset(32)
			make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
			make.right.equalTo(view.safeAreaLayoutGuide).offset(-20)
		}
		
		buttonStackView.snp.makeConstraints { make in
			make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
			make.right.equalTo(view.safeAreaLayoutGuide).offset(-20)
			make.bottom.equalTo(view.safeAreaLayoutGuide).offset(-28)
		}
	}
}
