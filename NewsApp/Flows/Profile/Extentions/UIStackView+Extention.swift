//
//  UIStackView+Extention.swift
//  NewsApp
//
//  Created by VASILY IKONNIKOV on 17.05.2023.
//

import UIKit

extension UIStackView {
	convenience init (axis: NSLayoutConstraint.Axis, alignment: Alignment, distribution: Distribution, spacing: CGFloat = 0) {
		self.init()
		self.axis = axis
		self.alignment = alignment
		self.distribution = distribution
		self.spacing = spacing
		contentMode = .scaleToFill
	}
}
