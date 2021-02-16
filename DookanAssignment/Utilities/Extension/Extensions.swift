//
//  Extensions.swift
//  DookanAssignment
//
//  Created by Ankit Bansal on 10/02/21.
//

import Foundation
import UIKit

 extension UIView {
    
    /**
     Call this function to add shadow to view
     */
    
    func addShadow(_ color: UIColor) {
        layer.masksToBounds = false
        layer.shadowPath = UIBezierPath(rect: self.bounds).cgPath
        layer.shadowRadius = 10
        layer.shadowColor = color.cgColor
        layer.shadowOffset = .zero
        layer.shadowOpacity = 1
        layer.shouldRasterize = true
        layer.rasterizationScale = UIScreen.main.scale
    }
}

extension UILabel {
    
    func setValue(_ text: String, _ textColor: UIColor?, _ fontSize: CGFloat, _ fontFamily: String) {
        self.text = text
        if let textColor = textColor {
            self.textColor = textColor
        }
        self.font = UIFont(name: fontFamily, size: fontSize)
        //self.setLineHeight(lineHeight)
    }
    
   private func setLineHeight(_ lineHeight: CGFloat) {
        let text = self.text
        if let text = text {
            let attributeString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            style.lineSpacing = lineHeight
            attributeString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSMakeRange(0, text.count))
            self.attributedText = attributeString
        }
    }
}

extension UIButton {
    
    func setValue(_ title: String, _ titleColor: UIColor, _ fontSize: CGFloat, _ fontFamily: String) {
        self.setTitle(title, for: .normal)
        self.setTitleColor(titleColor, for: .normal)
        self.titleLabel?.font = UIFont(name: fontFamily, size: fontSize)
        //self.setLineHeight(lineHeight)
    }
    
   private func setLineHeight(_ lineHeight: CGFloat) {
        let text = self.titleLabel?.text
        if let text = text {
            let attributeString = NSMutableAttributedString(string: text)
            let style = NSMutableParagraphStyle()
            style.lineSpacing = lineHeight
            attributeString.addAttribute(NSAttributedString.Key.paragraphStyle, value: style, range: NSMakeRange(0, text.count))
            self.titleLabel?.attributedText = attributeString
        }
    }
}



