//
//  RegistrationViewController.swift
//  NewsApp
//
//  Created by Луиза Самойленко on 16.05.2023.
//

import UIKit
import SnapKit

class RegistrationViewController: UIViewController {
    struct Spec {
        static let welcomeLabelText = "Welcome to NewsToDay"
        static let greetingLabelText = "Hello, I guess you are new around here. You can start using the application after sign up."
        static let nameTextFieldPlaceholder = "Username"
        static let emailTextFieldPlaceholder = "Email Adress"
        static let passwordTextFieldPlaceholder = "Password"
        static let repeatPasswordTextFieldPlaceholder = "Reapeat password"
        static let registrationButtonTitle = "Sign Up"
        static let registrationLabelText = "Already have an account?"
        static let loginButtonTitle = "Sign In"
        static let alertTitle = "Passwords don't match!"
        static let alertMessage = "Please, check your password."
        static let alertActionTitle = "Ok"
    }

    private var scrollViewBottom: NSLayoutConstraint?
    private var iconClick = true

    private let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.backgroundColor = .clear
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private let contentView: UIView = {
        let contentView = UIView()
        contentView.backgroundColor = .clear
        contentView.translatesAutoresizingMaskIntoConstraints = false
        return contentView
    }()

    private lazy var welcomeLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.text = Spec.welcomeLabelText
        label.font = .interSemiBold(14)
        label.textColor = .blackPrimary
        label.numberOfLines = 1
        return label
    }()

    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = Spec.greetingLabelText
        label.font = .interRegular(16)
        label.textColor = .grayPrimary
        return label
    }()

    private lazy var nameTextFieldView: TextFieldView = {
        let textFieldView = TextFieldView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.image.image = .personImage
        textFieldView.textField.placeholder = Spec.nameTextFieldPlaceholder
        textFieldView.hidePasswordButton.isHidden = true
        return textFieldView
    }()

    private lazy var emailTextFieldView: TextFieldView = {
        let textFieldView = TextFieldView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.image.image = .emailImage
        textFieldView.textField.placeholder = Spec.emailTextFieldPlaceholder
        textFieldView.hidePasswordButton.isHidden = true
        return textFieldView
    }()

    private lazy var passwordTextFieldView: TextFieldView = {
        let textFieldView = TextFieldView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.image.image = .passwordImage
        textFieldView.textField.placeholder = Spec.passwordTextFieldPlaceholder
        textFieldView.textField.isSecureTextEntry = true
        textFieldView.hidePasswordButton.addTarget(self, action: #selector(hidePassword), for: .touchUpInside)
        return textFieldView
    }()

    private lazy var repeatPasswordTextFieldView: TextFieldView = {
        let textFieldView = TextFieldView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.image.image = .passwordImage
        textFieldView.textField.placeholder = Spec.repeatPasswordTextFieldPlaceholder
        textFieldView.textField.isSecureTextEntry = true
        textFieldView.hidePasswordButton.addTarget(self, action: #selector(hideRepeatedPassword), for: .touchUpInside)
        return textFieldView
    }()

    private lazy var registrationButton: SignUpButton = {
        let button = SignUpButton(title: Spec.registrationButtonTitle)
        button.addTarget(self, action: #selector(openProfileViewController), for: .touchUpInside)
        return button
    }()

    private lazy var loginStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 8
        return stackView
    }()

    private lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = Spec.registrationLabelText
        label.font = .interMedium(16)
        label.textColor = .blackPrimary
        label.numberOfLines = 1
        return label
    }()

    private lazy var loginButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(.blackPrimary, for: .normal)
        button.titleLabel?.font = .interSemiBold(16)
        button.setTitle(Spec.loginButtonTitle, for: .normal)
        button.addTarget(self, action: #selector(openSignInViewController), for: .touchUpInside)
        return button
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureView()
        setupViews()
        setupConstraints()
        configureTapGesture()
        configurationNotificationCenter()
    }

    @objc private func openProfileViewController() {
        checkPassword()
    }

    private func checkPassword() {
        if passwordTextFieldView.textField.text == repeatPasswordTextFieldView.textField.text {
            let vc = ProfileViewController()
            show(vc, sender: true)
        } else {
            let alert = UIAlertController(title: Spec.alertTitle, message: Spec.alertMessage, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: Spec.alertActionTitle, style: .default))
            self.present(alert, animated: true, completion: nil)
        }
    }
}

extension RegistrationViewController {
    private func configureView() {
        view.backgroundColor = .white
    }

    private func setupViews() {
        view.addSubview(scrollView)
        scrollView.addSubview(contentView)
        contentView.addSubview(welcomeLabel)
        contentView.addSubview(greetingLabel)
        contentView.addSubview(nameTextFieldView)
        contentView.addSubview(emailTextFieldView)
        contentView.addSubview(passwordTextFieldView)
        contentView.addSubview(repeatPasswordTextFieldView)
        contentView.addSubview(registrationButton)
        view.addSubview(loginStackView)
        loginStackView.addArrangedSubview(loginLabel)
        loginStackView.addArrangedSubview(registrationButton)
    }

    private func setupConstraints() {
        scrollViewBottom = scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollViewBottom!,

            contentView.widthAnchor.constraint(equalTo: scrollView.widthAnchor),
            contentView.leadingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.leadingAnchor),
            contentView.trailingAnchor.constraint(equalTo: scrollView.contentLayoutGuide.trailingAnchor),
            contentView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor),
            contentView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor),

            welcomeLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            welcomeLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            welcomeLabel.topAnchor.constraint(equalTo: contentView.topAnchor, constant: 33),

            greetingLabel.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            greetingLabel.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            greetingLabel.topAnchor.constraint(equalTo: welcomeLabel.bottomAnchor, constant: 8),

            nameTextFieldView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            nameTextFieldView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            nameTextFieldView.topAnchor.constraint(equalTo: greetingLabel.bottomAnchor, constant: 32),
            nameTextFieldView.heightAnchor.constraint(equalToConstant: 56),

            emailTextFieldView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            emailTextFieldView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            emailTextFieldView.topAnchor.constraint(equalTo: nameTextFieldView.bottomAnchor, constant: 16),
            emailTextFieldView.heightAnchor.constraint(equalToConstant: 56),

            passwordTextFieldView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            passwordTextFieldView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            passwordTextFieldView.topAnchor.constraint(equalTo: emailTextFieldView.bottomAnchor, constant: 16),
            passwordTextFieldView.heightAnchor.constraint(equalToConstant: 56),

            repeatPasswordTextFieldView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            repeatPasswordTextFieldView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            repeatPasswordTextFieldView.topAnchor.constraint(equalTo: passwordTextFieldView.bottomAnchor, constant: 16),
            repeatPasswordTextFieldView.heightAnchor.constraint(equalToConstant: 56),

            registrationButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            registrationButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            registrationButton.topAnchor.constraint(equalTo: repeatPasswordTextFieldView.bottomAnchor, constant: 16),
            registrationButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            registrationButton.heightAnchor.constraint(equalToConstant: 56),

            loginStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -42)
        ])
    }

    private func configureTapGesture() {
        let tapGesture = UITapGestureRecognizer(target: view, action: #selector(UIView.endEditing))
        view.addGestureRecognizer(tapGesture)
    }

    private func configurationNotificationCenter() {
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
    }

    @objc func keyboardWillShow(notification: Notification) {
        if let keyboardSize = (notification.userInfo?[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
            scrollViewBottom?.constant = -keyboardSize.height
        }
    }

    @objc func keyboardWillHide(notification: Notification) {
        scrollViewBottom?.constant = 0
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

    @objc private func hideRepeatedPassword() {
        if iconClick {
            repeatPasswordTextFieldView.textField.isSecureTextEntry = false
            repeatPasswordTextFieldView.hidePasswordButton.setImage(.eyeImage, for: .normal)
        } else {
            repeatPasswordTextFieldView.textField.isSecureTextEntry = true
            repeatPasswordTextFieldView.hidePasswordButton.setImage(.eyeSlashImage, for: .normal)
        }
        iconClick = !iconClick
    }

    @objc private func openSignInViewController() {
        let vc = AuthorizationViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }
}
