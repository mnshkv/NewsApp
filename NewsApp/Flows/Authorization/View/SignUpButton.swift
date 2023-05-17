//
//  SignUpButton.swift
//  NewsApp
//
//  Created by Луиза Самойленко on 15.05.2023.
//

import UIKit

class SignUpButton: UIButton {
    init(title: String) {
        super.init(frame: .zero)
        setTitle(title, for: .normal)
        setupButton()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupButton()
    }

    private func setupButton() {
        translatesAutoresizingMaskIntoConstraints = false
        titleLabel?.font = .interSemiBold(16)
        setTitleColor(.white, for: .normal)
        contentMode = .center
        backgroundColor = .purple
        layer.cornerRadius = 12
    }
}
