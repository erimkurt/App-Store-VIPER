//
//  ApplicationDetailInformationRows.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 21/11/2563 BE.
//

import Foundation

enum ApplicationDetailInformationRows: Int {
    case provider
    case size
    case category
    case languages
    case ageRating
    
    static let count: Int = {
        var max: Int = 0
        while let _ = ApplicationDetailInformationRows(rawValue: max) { max += 1 }
        return max
    }()
    
    var title: String? {
        switch self {
        case .provider:
            return "Provider"
        case .size:
            return "Size"
        case .category:
            return "Category"
        case .languages:
            return "Languages"
        case .ageRating:
            return "Age Rating"
        }
    }
    
    func detail(application: Application?) -> String? {
        switch self {
        case .provider:
            return application?.artistName
        case .size:
            return application?.size
        case .category:
            return application?.genreTitle
        case .languages:
            return application?.language
        case .ageRating:
            return application?.trackContentRating
        }
    }
    
    func expandedDetail(application: Application?) -> String? {
        switch self {
        case .languages:
            return application?.languages
        case .ageRating:
            return application?.ageRating
        default:
            return nil
        }
    }
    
    var expandable: Bool {
        switch self {
        case .languages:
            return true
        case .ageRating:
            return true
        default:
            return false
        }
    }
}
