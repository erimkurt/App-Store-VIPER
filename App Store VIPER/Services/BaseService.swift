//
//  BaseService.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//

import Foundation

class BaseService {
    let baseURLRSS: String = "\(Config.baseProtocol)rss.\(Config.baseURLMarketingTools)/api/\(Config.version)/\(Config.region)/\(MediaType.iosApps.rawValue)"
    let baseURLMarketingTools: String = "\(Config.baseProtocol)\(Config.baseURLMarketingTools)/\(Config.region)"
    let baseURL: String = "\(Config.baseProtocol)\(Config.baseURL)/\(Config.region)"
}
