//
//  GetButton.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//

import UIKit

enum GetButtonStyle {
    case gray
    case blue
}

class GetButton: UIButton {
    
    var style: GetButtonStyle = .gray {
        didSet {
            updateUI()
        }
    }
    
    override func draw(_ rect: CGRect) {
    }
    
    func updateUI() {
        var titleColor: UIColor = .link
        var background: UIColor = .gray
        
        switch style {
        case .gray:
            titleColor = .link
            background = UIColor.gray.withAlphaComponent(0.2)
        case .blue:
            titleColor = .white
            background = .link
        }
        
        setTitleColor(titleColor, for: .normal)
        backgroundColor = background
        cornerRadius = 15
        titleLabel?.font = UIFont.boldSystemFont(ofSize: 17)
        contentEdgeInsets = UIEdgeInsets(top: 5, left: 20, bottom: 5, right: 20)
    }
}
