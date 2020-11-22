//
//  ServiceLocator.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//

import Foundation

class ServiceLocator {
    var appService = AppService()

    class var shared: ServiceLocator {
        struct Static {
            static let instance: ServiceLocator = ServiceLocator()
        }
        return Static.instance
    }
}
