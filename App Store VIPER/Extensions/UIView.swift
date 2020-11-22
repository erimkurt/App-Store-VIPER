//
//  UIView.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//

import UIKit

extension UIView {
    static var CellIdentifier : String {
        return "\(self)"
    }
    
    static var NibName : String {
        return "\(self)"
    }
    
    @IBInspectable var cornerRadius: CGFloat {
        get {
            return layer.cornerRadius
        }
        set {
            layer.cornerRadius = newValue
            layer.masksToBounds = (newValue > 0)
        }
    }
    
    @IBInspectable var shadowColor: UIColor {
        get {
            return UIColor(cgColor: layer.shadowColor ?? UIColor.black.cgColor)
        }
        set {
            layer.masksToBounds = false
            layer.shadowColor = newValue.cgColor
            layer.shadowOpacity = 0.1
            layer.shadowOffset = .zero
            layer.shadowRadius = 5
        }
    }

    @IBInspectable var borderWidth: CGFloat {
        get {
            return layer.borderWidth
        }
        set {
            layer.borderWidth = newValue
        }
    }

    @IBInspectable var borderColor: UIColor? {
        get {
            if let color = layer.borderColor {
                return UIColor(cgColor: color)
            } else {
                return nil
            }
        }
        set {
            layer.borderColor = newValue!.cgColor
        }
    }
}
