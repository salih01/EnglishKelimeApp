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
    func addBorder(color: UIColor, width: CGFloat) {
        layer.borderColor = color.cgColor
        layer.borderWidth = width
    }
    
    func blurEffect(view: UIView, alpha: CGFloat) {
        let blurEffect = UIBlurEffect(style: .systemChromeMaterialDark)
        let visualEffectView = UIVisualEffectView(effect: blurEffect)
        visualEffectView.frame = view.bounds
        visualEffectView.alpha = alpha
        visualEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight] // for supporting device rotation
        view.addSubview(visualEffectView)
    }

}
extension UIButton {
    func hapticFeedback(style: UIImpactFeedbackGenerator.FeedbackStyle) {
        let generator = UIImpactFeedbackGenerator(style: style)
        generator.prepare()
        generator.impactOccurred()
    }
}

extension UIImageView {
    func addCornerRadius(radius: CGFloat) {
        layer.cornerRadius = radius
        layer.masksToBounds = true
    }

}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
}


extension UIImageView {
    func addCornerRadiusToBottom(radius: CGFloat) {
        let maskLayer = CAShapeLayer()
        maskLayer.path = UIBezierPath(roundedRect: bounds, byRoundingCorners: [.bottomLeft, .bottomRight], cornerRadii: CGSize(width: radius, height: radius)).cgPath
        layer.mask = maskLayer
    }
}



