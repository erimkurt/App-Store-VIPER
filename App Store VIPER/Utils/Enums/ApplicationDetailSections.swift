//
//  ApplicationDetailSections.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 21/11/2563 BE.
//

import Foundation

enum ApplicationDetailSections: Int {
    case header
    case previewInformation
    case preview
    case description
    case ratings
    case reviews
    case information
    
    static let count: Int = {
        var max: Int = 0
        while let _ = ApplicationDetailSections(rawValue: max) { max += 1 }
        return max
    }()
    
    var title: String? {
        switch self {
        case .preview:
            return "Preview"
        case .ratings:
            return "Ratings & Reviews"
        case .information:
            return "Information"
        default:
            return nil
        }
    }
}
