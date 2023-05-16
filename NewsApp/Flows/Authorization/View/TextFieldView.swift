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
        imageView.tintColor = UIColor(named: "grayPrimary")
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
    }

    private func createTextFieldView() {
        backgroundColor = UIColor(named: "grayLighter")
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
            make.right.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
        }
    }
}

extension TextFieldView: UITextFieldDelegate {
    func textFieldShouldBeginEditing(_ textField: UITextField) -> Bool {
        updateUI()
        return true
    }

    func textFieldDidChangeSelection(_ textField: UITextField) {
        updateUI()
    }

    func updateUI() {
        layer.borderColor = UIColor(named: "purple")?.cgColor
        layer.borderWidth = 1
        image.tintColor = UIColor(named: "purple")
    }
}
