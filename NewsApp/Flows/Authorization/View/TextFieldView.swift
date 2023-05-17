//
//  TextFieldView.swift
//  NewsApp
//
//  Created by Луиза Самойленко on 15.05.2023.
//

import UIKit

class TextFieldView: UIView {
    lazy var image: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.masksToBounds = true
        imageView.tintColor = .grayPrimary
        return imageView
    }()

    lazy var textField: UITextField = {
        let textField = UITextField()
        textField.attributedPlaceholder = NSAttributedString(string: "Placeholder Text", attributes: [
            .foregroundColor: UIColor(named: "grayPrimary"),
            .font: UIFont.systemFont(ofSize: 16)
        ])
        textField.textAlignment = .left
        return textField
    }()

    lazy var hidePasswordButton: UIButton = {
        let button = UIButton()
        button.tintColor = .grayPrimary
        button.setImage(.eyeSlashImage, for: .normal)
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }

    private func commonInit() {
        addViews()
        createTextFieldView()
        setupConstraints()
        textField.delegate = self
    }
}

extension TextFieldView {
    private func addViews() {
        addSubview(image)
        addSubview(textField)
        addSubview(hidePasswordButton)
    }

    private func createTextFieldView() {
        backgroundColor = .grayLighter
        layer.masksToBounds = true
        layer.cornerRadius = 12
    }

    private func setupConstraints() {
        image.snp.makeConstraints { make in
            make.left.equalToSuperview().inset(18)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
        textField.snp.makeConstraints { make in
            make.left.equalTo(image.snp.right).inset(-24)
            make.right.equalTo(hidePasswordButton.snp.left).inset(8)
            make.centerY.equalToSuperview()
        }
        hidePasswordButton.snp.makeConstraints { make in
            make.right.equalToSuperview().inset(18)
            make.centerY.equalToSuperview()
            make.width.height.equalTo(24)
        }
    }
}

extension TextFieldView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        updateTextfieldColor()
        return true
    }

    func textFieldDidEndEditing(_ textField: UITextField) {
        if textField.text?.isEmpty ?? false {
            configureEndEditing()
        }
    }

    private func configureEndEditing() {
        returnTextfieldColor()
    }

    func returnTextfieldColor() {
        layer.borderColor = nil
        layer.borderWidth = 0
        image.tintColor = .grayPrimary
    }

    func updateTextfieldColor() {
        layer.borderColor = UIColor.purple?.cgColor
        layer.borderWidth = 1
        image.tintColor = .purple
    }
}
