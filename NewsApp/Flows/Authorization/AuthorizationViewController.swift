//
//  AuthorizationViewController.swift
//  NewsApp
//
//  Created by Луиза Самойленко on 15.05.2023.
//

import UIKit
import SnapKit

class AuthorizationViewController: UIViewController {
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Welcome Back 👋"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = UIColor(named: "blackPrimary")
        label.numberOfLines = 1
        return label
    }()

    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "I am happy to see you again. You can continue where you left off by logging in"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "grayPrimary")
        return label
    }()

    private lazy var emailTextFieldView: TextFieldView = {
        let textFieldView = TextFieldView()
        textFieldView.image.image = UIImage(named: "emailImage")
        textFieldView.textField.placeholder = "Email Adress"
        return textFieldView
    }()

    private lazy var passwordTextFieldView: TextFieldView = {
        let textFieldView = TextFieldView()
        textFieldView.image.image = UIImage(named: "passwordImage")
        textFieldView.textField.placeholder = "Password"
        textFieldView.textField.isSecureTextEntry = true
        return textFieldView
    }()

    private lazy var registrationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.spacing = 8
        return stackView
    }()

    private lazy var registrationLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Don't have an account?"
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "blackPrimary")
        label.numberOfLines = 1
        return label
    }()

    private lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.tintColor = UIColor(named: "blackPrimary")
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitle("Sign Up", for: .normal)
        button.addTarget(self, action: #selector(openSignUpViewController), for: .touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @objc private func openSignUpViewController() {
        print("Open SignUpVC")
    }

    
}
