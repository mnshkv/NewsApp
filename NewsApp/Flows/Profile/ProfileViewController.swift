//
//  ProfileViewController.swift
//  NewsApp
//
//  Created by Aleksandr Menshikov on 10.05.2023.
//

//import UIKit
//import SDWebImage
//
//class ProfileViewController: UIViewController {
//
//    let profileService = ProfileService()
//
//    override func viewDidLoad() {
//        super.viewDidLoad()
//
//        // Do any additional setup after loading the view.
//        view.backgroundColor = .systemBackground
//
//        profileService.fetchProfile { profile in
//            if let profile = profile {
//                print("APP: look on profile \(profile.name)")
//            }
//        }
//    }
//
//
//    /*
//    // MARK: - Navigation
//
//    // In a storyboard-based application, you will often want to do a little preparation before navigation
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        // Get the new view controller using segue.destination.
//        // Pass the selected object to the new view controller.
//    }
//    */
//
//}


import UIKit
import SnapKit

class ProfileViewController: UIViewController {
	
	let profileService = ProfileService()
	
	private let profileView = ProfileView()
	private let languageButton = Button(title: "Language", imageName: "arrow")
	private let termsButton = Button(title: "Terms & Conditions", imageName: "arrow")
	private let signOutButton = Button(title: "Sign Out", imageName: "signOut")
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
		
	}
	
}

// MARK: - Layout and Style

extension ProfileViewController {
	
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
