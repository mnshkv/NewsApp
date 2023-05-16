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
        label.numberOfLines = 0
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

    private lazy var loginButton: SignUpButton = {
        let button = SignUpButton(title: "Sign In")
        return button
    }()

    private lazy var registrationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 8
        return stackView
    }()

    private lazy var registrationLabel: UILabel = {
        let label = UILabel()
        label.text = "Don't have an account?"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(named: "blackPrimary")
        label.numberOfLines = 1
        return label
    }()

    private lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(named: "blackPrimary"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("Sign Up", for: .normal)
        button.addTarget(self, action: #selector(openSignUpViewController), for: .touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setupViews()
        setupConstraints()
        configureTapGesture()
        
    }

    @objc private func openSignUpViewController() {
        let vc = RegistrationViewController()
        show(vc, sender: self)
    }
}

extension AuthorizationViewController {
    private func setupViews() {
        view.addSubview(welcomeLabel)
        view.addSubview(greetingLabel)
        view.addSubview(emailTextFieldView)
        view.addSubview(passwordTextFieldView)
        view.addSubview(loginButton)
        view.addSubview(registrationStackView)
        registrationStackView.addArrangedSubview(registrationLabel)
        registrationStackView.addArrangedSubview(registrationButton)
    }

    private func setupConstraints() {
        welcomeLabel.snp.makeConstraints { make in
            make.top.equalToSuperview().inset(72)
            make.left.right.equalTo(20)
        }
        greetingLabel.snp.makeConstraints { make in
            make.top.equalTo(welcomeLabel.snp.bottom).inset(-8)
            make.left.right.equalToSuperview().inset(20)
        }
        emailTextFieldView.snp.makeConstraints { make in
            make.top.equalTo(greetingLabel.snp.bottom).inset(-32)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(56)
        }
        passwordTextFieldView.snp.makeConstraints { make in
            make.top.equalTo(emailTextFieldView.snp.bottom).inset(-16)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(56)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextFieldView.snp.bottom).inset(-64)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(56)
        }
        registrationStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-42)
        }
    }

    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
}
