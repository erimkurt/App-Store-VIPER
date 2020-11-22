//
//  UIAlertController.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//

import UIKit

extension UIAlertController {
    class func showAlertMessage(with titleString: String, messageString: String? = nil, viewController: UIViewController?, dismissCallback :((UIAlertAction) -> Void)? = nil) {
        let alertController = UIAlertController(title: titleString, message: messageString, preferredStyle: .alert)
        let okAction = UIAlertAction(title: "Ok", style: .default, handler: dismissCallback)
        alertController.addAction(okAction)
        viewController?.present(alertController, animated: true, completion: nil)
    }
    
    static func showAlertMessage(with error: Error, title: String? = nil, viewController: UIViewController?, dismissCallback :((UIAlertAction) -> Void)? = nil) {
        if let viewController = viewController {
            let alertController = UIAlertController(title: title ?? "Error" , message: error.localizedDescription, preferredStyle: .alert)
            
            let okAction = UIAlertAction(title: "Ok", style: .cancel, handler: dismissCallback)
            alertController.addAction(okAction)
            
            viewController.present(alertController, animated: true, completion: nil)
        }
    }
}
