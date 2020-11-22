//
//  Feed.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//

import Foundation

struct Feed: Codable {
    let title: String
    let id: String
    let results: [Application]
}
