//
//  UIViewExtensions.swift
//  EnglishKelimeApp
//
//  Created by BilmSoft on 14.07.2023.
//
import UIKit

extension UIView {
    func addCornerRadiusAndShadow(cornerRadius: CGFloat, shadowColor: UIColor, shadowOpacity: Float, shadowOffset: CGSize, shadowRadius: CGFloat) {
        layer.cornerRadius = cornerRadius
        layer.shadowColor = shadowColor.cgColor
        layer.shadowOpacity = shadowOpacity
        layer.shadowOffset = shadowOffset
        layer.shadowRadius = shadowRadius
    }
}

extension UIView {
    func addBorder(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
}

extension UIImageView {
    func addCornerRadius(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }
}



