//
//  LanguageViewController.swift
//  NewsApp
//
//  Created by VASILY IKONNIKOV on 17.05.2023.
//

import UIKit

class LanguageViewController: UIViewController {
	
	private let englishLanguage = Button(title: "English", imageName: UIImage.check)// imageName: "check")
	private let russianLanguage = Button(title: "Russian", imageName: UIImage.check)
	private let stackView = UIStackView(axis: .vertical, alignment: .fill, distribution: .fillEqually, spacing: 16)
	
    override func viewDidLoad() {
        super.viewDidLoad()
		style()
		addSubviews()
		setupConstraints()
		addTargets()
    }
}

// MARK: - Button actions

private extension LanguageViewController {
	@objc func chooseLanguage(_ sender: UIButton) {
		print(sender.configuration?.title)
		englishLanguage.configuration?.baseBackgroundColor = UIColor.grayLighter
		englishLanguage.configuration?.baseForegroundColor = UIColor.grayDarker
		russianLanguage.configuration?.baseBackgroundColor = UIColor.grayLighter
		russianLanguage.configuration?.baseForegroundColor = UIColor.grayDarker
		
		sender.configuration?.baseBackgroundColor = UIColor.purple
		sender.configuration?.baseForegroundColor = UIColor.white
	}
	
	@objc private func popToPrevious() {
		navigationController?.popViewController(animated: true)
	}
	
	func addTargets() {
		englishLanguage.addTarget(self, action: #selector(chooseLanguage), for: .touchUpInside)
		russianLanguage.addTarget(self, action: #selector(chooseLanguage), for: .touchUpInside)
	}
}

// MARK: - Style

private extension LanguageViewController {
	func style() {
		tabBarController?.tabBar.isHidden = true
		view.backgroundColor = .systemBackground
		setupNavigationBarAppearance()
	}
	
	func setupNavigationBarAppearance() {
		
		let backButton = UIBarButtonItem(
			image: UIImage.back,
			style: .plain,
			target: self,
			action: #selector(popToPrevious)
		)

		navigationController?.navigationBar.titleTextAttributes = [
			.foregroundColor: UIColor.blackPrimary ?? UIColor.black,
			.font: UIFont.interSemiBold(24) ?? UIFont.systemFont(ofSize: 24)
		]
		
		navigationController?.navigationBar.tintColor = UIColor.grayPrimary
		navigationItem.leftBarButtonItem = backButton
		navigationItem.largeTitleDisplayMode = .never
		navigationItem.title = "Language"
	}
}

// MARK: - Layout and Subviews

private extension LanguageViewController {
	func addSubviews() {
		view.addSubview(stackView)
		stackView.addArrangedSubview(englishLanguage)
		stackView.addArrangedSubview(russianLanguage)
	}
	
	func setupConstraints() {
		stackView.snp.makeConstraints { make in
			make.top.equalTo(view.safeAreaLayoutGuide).offset(24)
			make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
			make.right.equalTo(view.safeAreaLayoutGuide).offset(-20)
		}
	}
}
