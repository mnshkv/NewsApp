//
//  AuthorizationViewController.swift
//  NewsApp
//
//  Created by Луиза Самойленко on 15.05.2023.
//

import UIKit
import SnapKit

class AuthorizationViewController: UIViewController {

    struct Spec {
        static let welcomeLabelText = "Welcome Back 👋"
        static let greetingLabelText = "I am happy to see you again. You can continue where you left off by logging in"
        static let emailTextFieldPlaceholder = "Email Adress"
        static let passwordTextFieldPlaceholder = "Password"
        static let loginButtonTitle = "Sign In"
        static let registrationLabelText = "Don't have an account?"
        static let registrationButtonTitle = "Sign Up"
    }

    private var iconClick = true
    
    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.text = Spec.welcomeLabelText
        label.font = .interSemiBold(24)
        label.textColor = .blackPrimary
        label.numberOfLines = 1
        return label
    }()

    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = Spec.greetingLabelText
        label.font = .interRegular(16)
        label.textColor = .grayPrimary
        return label
    }()

    private lazy var emailTextFieldView: TextFieldView = {
        let textFieldView = TextFieldView()
        textFieldView.image.image = .emailImage
        textFieldView.textField.placeholder = Spec.emailTextFieldPlaceholder
        textFieldView.hidePasswordButton.isHidden = true
        return textFieldView
    }()

    private lazy var passwordTextFieldView: TextFieldView = {
        let textFieldView = TextFieldView()
        textFieldView.image.image = .passwordImage
        textFieldView.textField.placeholder = Spec.passwordTextFieldPlaceholder
        textFieldView.textField.isSecureTextEntry = true
        textFieldView.hidePasswordButton.addTarget(self, action: #selector(hidePassword), for: .touchUpInside)
        return textFieldView
    }()

    private lazy var loginButton: SignUpButton = {
        let button = SignUpButton(title: Spec.loginButtonTitle)
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
        label.text = Spec.registrationLabelText
        label.font = .interMedium(16)
        label.textColor = .blackPrimary
        label.numberOfLines = 1
        return label
    }()

    private lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.setTitleColor(.blackPrimary, for: .normal)
        button.titleLabel?.font = .interSemiBold(16)
        button.setTitle(Spec.registrationButtonTitle, for: .normal)
        button.addTarget(self, action: #selector(openSignUpViewController), for: .touchUpInside)
        return button
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupViews()
        setupConstraints()
        configureTapGesture()
    }

    @objc private func openSignUpViewController() {
        let vc = RegistrationViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        self.present(vc, animated: true)
    }

    @objc private func openProfileViewController() {
        let vc = ProfileViewController()
        show(vc, sender: true)
    }

    private func configureView() {
        view.backgroundColor = .white
    }

    @objc private func hidePassword() {
        if iconClick {
            passwordTextFieldView.textField.isSecureTextEntry = false
            passwordTextFieldView.hidePasswordButton.setImage(.eyeImage, for: .normal)
        } else {
            passwordTextFieldView.textField.isSecureTextEntry = true
            passwordTextFieldView.hidePasswordButton.setImage(.eyeSlashImage, for: .normal)
        }
        iconClick = !iconClick
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
