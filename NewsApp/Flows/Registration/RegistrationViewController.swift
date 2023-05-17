//
//  RegistrationViewController.swift
//  NewsApp
//
//  Created by Луиза Самойленко on 16.05.2023.
//

import UIKit
import SnapKit

class RegistrationViewController: UIViewController {

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
        label.text = "Welcome to NewsToDay"
        label.font = UIFont.boldSystemFont(ofSize: 24)
        label.textColor = UIColor(named: "blackPrimary")
        label.numberOfLines = 1
        return label
    }()

    private lazy var greetingLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textAlignment = .left
        label.numberOfLines = 0
        label.text = "Hello, I guess you are new around here. You can start using the application after sign up."
        label.font = UIFont.boldSystemFont(ofSize: 16)
        label.textColor = UIColor(named: "grayPrimary")
        return label
    }()

    private lazy var nameTextFieldView: TextFieldView = {
        let textFieldView = TextFieldView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.image.image = UIImage(named: "personImage")
        textFieldView.textField.placeholder = "Username"
        textFieldView.hidePasswordButton.isHidden = true
        return textFieldView
    }()

    private lazy var emailTextFieldView: TextFieldView = {
        let textFieldView = TextFieldView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.image.image = UIImage(named: "emailImage")
        textFieldView.textField.placeholder = "Email Adress"
        textFieldView.hidePasswordButton.isHidden = true
        return textFieldView
    }()

    private lazy var passwordTextFieldView: TextFieldView = {
        let textFieldView = TextFieldView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.image.image = UIImage(named: "passwordImage")
        textFieldView.textField.placeholder = "Password"
        textFieldView.textField.isSecureTextEntry = true
        textFieldView.hidePasswordButton.addTarget(self, action: #selector(hidePassword), for: .touchUpInside)
        return textFieldView
    }()

    private lazy var repeatPasswordTextFieldView: TextFieldView = {
        let textFieldView = TextFieldView()
        textFieldView.translatesAutoresizingMaskIntoConstraints = false
        textFieldView.image.image = UIImage(named: "passwordImage")
        textFieldView.textField.placeholder = "Reapeat password"
        textFieldView.textField.isSecureTextEntry = true
        textFieldView.hidePasswordButton.addTarget(self, action: #selector(hideRepeatedPassword), for: .touchUpInside)
        return textFieldView
    }()

    private lazy var loginButton: SignUpButton = {
        let button = SignUpButton(title: "Sign up")
        button.addTarget(self, action: #selector(openProfileViewController), for: .touchUpInside)
        return button
    }()

    private lazy var registrationStackView: UIStackView = {
        let stackView = UIStackView()
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.spacing = 8
        return stackView
    }()

    private lazy var registrationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Already have an account?"
        label.font = UIFont.systemFont(ofSize: 16)
        label.textColor = UIColor(named: "blackPrimary")
        label.numberOfLines = 1
        return label
    }()

    private lazy var registrationButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.setTitleColor(UIColor(named: "blackPrimary"), for: .normal)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 16)
        button.setTitle("Sign In", for: .normal)
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
        contentView.addSubview(loginButton)
        view.addSubview(registrationStackView)
        registrationStackView.addArrangedSubview(registrationLabel)
        registrationStackView.addArrangedSubview(registrationButton)
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

            loginButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 20),
            loginButton.trailingAnchor.constraint(equalTo: contentView.trailingAnchor, constant: -20),
            loginButton.topAnchor.constraint(equalTo: repeatPasswordTextFieldView.bottomAnchor, constant: 16),
            loginButton.bottomAnchor.constraint(equalTo: contentView.bottomAnchor, constant: -8),
            loginButton.heightAnchor.constraint(equalToConstant: 56),

            registrationStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            registrationStackView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -42)
        ])
    }

    @objc private func openSignInViewController() {
        let vc = AuthorizationViewController()
        vc.modalPresentationStyle = .fullScreen
        self.present(vc, animated: true)
    }

    @objc private func openProfileViewController() {
        checkPassword()
    }

    private func checkPassword() {
        if passwordTextFieldView.textField.text == repeatPasswordTextFieldView.textField.text {
            let vc = ProfileViewController()
            show(vc, sender: true)
        } else {
            let alert = UIAlertController(title: "Passwords don't match!", message: "Please, check your password.", preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            self.present(alert, animated: true, completion: nil)
        }
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
            passwordTextFieldView.hidePasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            passwordTextFieldView.textField.isSecureTextEntry = true
            passwordTextFieldView.hidePasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
        iconClick = !iconClick
    }

    @objc private func hideRepeatedPassword() {
        if iconClick {
            repeatPasswordTextFieldView.textField.isSecureTextEntry = false
            repeatPasswordTextFieldView.hidePasswordButton.setImage(UIImage(systemName: "eye"), for: .normal)
        } else {
            repeatPasswordTextFieldView.textField.isSecureTextEntry = true
            repeatPasswordTextFieldView.hidePasswordButton.setImage(UIImage(systemName: "eye.slash"), for: .normal)
        }
        iconClick = !iconClick
    }
}
