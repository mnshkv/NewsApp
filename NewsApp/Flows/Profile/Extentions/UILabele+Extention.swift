//
//  UILabele+Extention.swift
//  NewsApp
//
//  Created by VASILY IKONNIKOV on 17.05.2023.
//

import UIKit

extension UILabel {
	convenience init(textColor: UIColor, fontSize: CGFloat, weight: UIFont.Weight = .regular) {
		self.init()
		self.text = "DSome text"
		self.textColor = textColor
		font = UIFont.systemFont(ofSize: fontSize, weight: weight)
	}
}
