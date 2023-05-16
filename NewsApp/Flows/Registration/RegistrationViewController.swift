//
//  RegistrationViewController.swift
//  NewsApp
//
//  Created by Луиза Самойленко on 16.05.2023.
//

import UIKit
import SnapKit

class RegistrationViewController: UIViewController {
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = "Welcome to NewsToDay"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = UIColor(named: "blackPrimary")
        label.numberOfLines = 1
        return label
    }()

    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Hello, I guess you are new around here. You can start using the application after sign up."
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "grayPrimary")
        return label
    }()

    private lazy var nameTextFieldView: TextFieldView = {
        let textFieldView = TextFieldView()
        textFieldView.image.image = UIImage(named: "personImage")
        textFieldView.textField.placeholder = "Username"
        return textFieldView
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

    private lazy var repeatPasswordTextFieldView: TextFieldView = {
        let textFieldView = TextFieldView()
        textFieldView.image.image = UIImage(named: "passwordImage")
        textFieldView.textField.placeholder = "Reapeat password"
        textFieldView.textField.isSecureTextEntry = true
        return textFieldView
    }()

    private lazy var loginButton: SignUpButton = {
        let button = SignUpButton(title: "Sign up")
//        button.isEnabled = false
        button.addTarget(self, action: #selector(openProfileViewController), for: .touchUpInside)
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
        label.text = "Already have an account?"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(named: "blackPrimary")
        label.numberOfLines = 1
        return label
    }()

    private lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(UIColor(named: "blackPrimary"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("Sign In", for: .normal)
        button.addTarget(self, action: #selector(openSignInViewController), for: .touchUpInside)
        return button
    }()

    var scrollViewBottom = 0.0

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupViews()
        setupConstraints()
        configureTapGesture()
    }

    private func configureView() {
        view.backgroundColor = .white
    }

    private func setupViews() {
        view.addSubview(welcomeLabel)
        view.addSubview(greetingLabel)
        view.addSubview(nameTextFieldView)
        view.addSubview(emailTextFieldView)
        view.addSubview(passwordTextFieldView)
        view.addSubview(repeatPasswordTextFieldView)
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
        nameTextFieldView.snp.makeConstraints { make in
            make.top.equalTo(greetingLabel.snp.bottom).inset(-32)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(56)
        }
        emailTextFieldView.snp.makeConstraints { make in
            make.top.equalTo(nameTextFieldView.snp.bottom).inset(-16)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(56)
        }
        passwordTextFieldView.snp.makeConstraints { make in
            make.top.equalTo(emailTextFieldView.snp.bottom).inset(-16)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(56)
        }
        repeatPasswordTextFieldView.snp.makeConstraints { make in
            make.top.equalTo(passwordTextFieldView.snp.bottom).inset(-16)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(56)
        }
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(repeatPasswordTextFieldView.snp.bottom).inset(-16)
            make.left.right.equalToSuperview().inset(20)
            make.height.equalTo(56)
        }
        registrationStackView.snp.makeConstraints { make in
            make.centerX.equalToSuperview()
            make.bottom.equalTo(-42)
        }
    }

    @objc private func openSignInViewController() {
        let vc = AuthorizationViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)
    }

    @objc private func openProfileViewController() {

        loginButton.isEnabled = false

        var passwordText = ""
        var repeatPasswordText = ""

        if let text = passwordTextFieldView.textField.text {
            passwordText = text
        }

        if let text = repeatPasswordTextFieldView.textField.text {
            repeatPasswordText = text
        }

        if passwordText == repeatPasswordText {
            loginButton.isEnabled = true
            print("Open Profile")
        }


//        if passwordTextFieldView.textField.text ?? "" == repeatPasswordTextFieldView.textField.text ?? "" {
//            print(passwordTextFieldView.textField.text!)
//            print(repeatPasswordTextFieldView.textField.text!)

            //        let vc = ProfileViewController()
            //        show(vc, sender: true)
//        }
    }

    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }
}
