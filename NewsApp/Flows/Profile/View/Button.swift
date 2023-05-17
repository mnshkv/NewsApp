//
//  Button.swift
//  NewsApp
//
//  Created by VASILY IKONNIKOV on 17.05.2023.
//

import UIKit

class Button: UIButton {
	convenience init(title: String, imageName: String) {
		self.init()
		configuration(with: title, imageName)
	}
	
	func configuration(with title: String, _ image: String) {
		configuration = .filled()
		configuration?.title = title
		
		var container = AttributeContainer()
		container.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
		
		configuration?.attributedTitle = AttributedString(title, attributes: container)
		if let image = UIImage(named: image) {
			configuration?.image = image
		}
		configuration?.baseBackgroundColor = UIColor.grayLighter //(named: "grayLighter")
		configuration?.baseForegroundColor = UIColor.grayDarker//(named: "grayDarker")
		configuration?.background.cornerRadius = 12
		configuration?.imagePlacement = .trailing
		contentHorizontalAlignment = .fill
		configuration?.contentInsets.leading = 22
		configuration?.contentInsets.trailing = 22
	}
	
	override var intrinsicContentSize: CGSize {
		return CGSize(width: UIView.noIntrinsicMetric, height: 56)
	}
	
}
