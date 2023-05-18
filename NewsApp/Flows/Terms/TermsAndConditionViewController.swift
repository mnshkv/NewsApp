//
//  TermsAndConditionViewController.swift
//  NewsApp
//
//  Created by VASILY IKONNIKOV on 17.05.2023.
//

import UIKit

class TermsAndConditionViewController: UIViewController {
	
	private lazy var textView: UITextView = {
		let textView = UITextView()
		textView.text = "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. \n\n Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo. \n\n Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt. \n\n Neque porro quisquam est, qui dolorem ipsum quia dolor sit amet, consectetur, adipisci velit, sed quia non numquam eius modi tempora incidunt ut labore et dolore magnam aliquam quaerat voluptatem."
		textView.font = UIFont.systemFont(ofSize: 16)
		textView.isSelectable = false
		textView.isEditable = false
		return textView
	}()
	
	override func viewDidLoad() {
		super.viewDidLoad()
		setupView()
		setupNavigationBarAppearance()
		addSubviews()
		setupConstraints()
	}
}

// MARK: - Style

private extension TermsAndConditionViewController {
	
	func setupView() {
		view.backgroundColor = .systemBackground
		tabBarController?.tabBar.isHidden = true
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
		navigationItem.title = "Terms & Conditions"
	}
	
	@objc private func popToPrevious() {
		navigationController?.popViewController(animated: true)
	}
	
}

// MARK: - Layout and AddSubviews

private extension TermsAndConditionViewController {
	func addSubviews() {
		view.addSubview(textView)
	}
	
	func setupConstraints() {
		textView.snp.makeConstraints { make in
			make.top.equalTo(view.safeAreaLayoutGuide).offset(20)
			make.left.equalTo(view.safeAreaLayoutGuide).offset(20)
			make.right.equalTo(view.safeAreaLayoutGuide).offset(-20)
			make.bottom.equalTo(view.safeAreaLayoutGuide)
		}
	}
}
