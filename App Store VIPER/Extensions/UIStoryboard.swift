//
//  UIStoryboard.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//

import UIKit

extension UIStoryboard {
    static func loadViewController<T>(suffix: String? = nil) -> T where T: StoryboardLoadable, T: UIViewController {
        var identifier = T.storyboardIdentifier()
        if let suffix = suffix {
            identifier += "_\(suffix)"
        }
        return UIStoryboard(name: T.storyboardName(), bundle: nil)
            .instantiateViewController(withIdentifier: identifier) as? T ?? T()
    }
}
