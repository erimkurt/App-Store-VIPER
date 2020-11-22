//
//  AppDelegate.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    let window: UIWindow = UIWindow()
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window.rootViewController = UINavigationController(rootViewController: TopFreeListRouter.createModule())
        window.makeKeyAndVisible()
        return true
    }
}

