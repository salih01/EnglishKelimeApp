//
//  UIViewExtensions.swift
//  EnglishKelimeApp
//
//  Created by BilmSoft on 14.07.2023.
//
import UIKit

extension UIView {
    
    func addShadow(color  : UIColor,
                   opacity: Float,
                   offset : CGSize,
                   radius : CGFloat)
    {
        layer.shadowColor   = color.cgColor
        layer.shadowOpacity = opacity
        layer.shadowOffset  = offset
        layer.shadowRadius  = radius
        
    }
    
}

extension UIButton {
    /// Adds a shadow to the button, with a corner radius
    /// - Parameters:
    ///   - corner: The corner radius to apply to the shadow and button
    ///   - color: The color of the shaodw
    ///   - opacity: The opacity of the shadow
    ///   - offset: The offset of the shadow
    ///   - radius: The radius of the shadow
    func addShadow(corner: CGFloat = 20, color: UIColor = .black, opacity: Float = 0.3, offset: CGSize = CGSize(width: 0, height: 5), radius: CGFloat = 5) {
        let shadowLayer = CAShapeLayer()
        layer.cornerRadius = corner
        shadowLayer.path = UIBezierPath(roundedRect: bounds, cornerRadius: corner).cgPath
        shadowLayer.fillColor = UIColor.clear.cgColor
        shadowLayer.shadowColor = color.cgColor
        shadowLayer.shadowPath = shadowLayer.path
        shadowLayer.shadowOffset = offset
        shadowLayer.shadowOpacity = opacity
        shadowLayer.shadowRadius = radius
        
        layer.insertSublayer(shadowLayer, at: 0)
    }
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(hideKeyboard))
        tapGesture.cancelsTouchesInView = false
        view.addGestureRecognizer(tapGesture)
    }

    @objc func hideKeyboard() {
        view.endEditing(true)
    }
}
extension UILabel {
    func addIcon(icon: UIImage, text: String, iconSize: CGSize, xOffset: CGFloat, yOffset: CGFloat) {
           let attachment = NSTextAttachment()
           attachment.image = icon
           attachment.bounds = CGRect(origin: CGPoint(x: xOffset, y: yOffset), size: iconSize)

           let attachmentString = NSAttributedString(attachment: attachment)
           let mutableAttributedString = NSMutableAttributedString(string: "")
           mutableAttributedString.append(attachmentString)

           let textString = NSMutableAttributedString(string: " \(text)")
           mutableAttributedString.append(textString)

           self.attributedText = mutableAttributedString
       }
}
