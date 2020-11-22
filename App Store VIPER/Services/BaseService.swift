//
//  BaseService.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//

import Foundation

class BaseService {
    let baseURLRSS: String = "\(Config.baseProtocol)rss.\(Config.baseURL)/api/\(Config.version)/\(Config.region)/\(MediaType.iosApps.rawValue)"
    let baseURL: String = "\(Config.baseProtocol)\(Config.baseURL)/\(Config.region)"
}
