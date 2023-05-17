//
//  UIFont+Extension.swift
//  NewsApp
//
//  Created by Луиза Самойленко on 17.05.2023.
//

import UIKit

extension UIFont {
    static func interMedium(_ size: CGFloat) -> UIFont? {
        return UIFont(name: "Inter-Medium", size: size)
    }

    static func interRegular(_ size: CGFloat) -> UIFont? {
        return UIFont(name: "Inter-Regular", size: size)
    }

    static func interSemiBold(_ size: CGFloat) -> UIFont? {
        return UIFont(name: "Inter-SemiBold", size: size)
    }
}
