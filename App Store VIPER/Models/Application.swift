//
//  Application.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//

import Foundation

struct Application: Codable {
    let id: String?
    let artistName: String?
    let releaseDate: String?
    let name: String?
    let trackName: String?
    let kind: String?
    let copyright: String?
    let artistUrl: String?
    let artworkUrl100: String?
    let url: String?
    let genres: [GenresValue]?
    let fileSizeBytes: String?
    let languageCodesISO2A: [String]?
    let trackContentRating: String?
    let advisories: [String]?
    let description: String?
    let userRatingCount: Int?
    let averageUserRating: Double?
    let screenshotUrls: [String]?
    
    var genrePreview: String {
        if let title = genres?.first?.genreValue?.name {
            return title
        } else {
            return genres?.first?.stringValue ?? ""
        }
    }
    
    var genreTitle: String {
        if let title = genres?.first?.genreValue?.name {
            return title
        } else {
            var title = ""
            let parentCategory = genres?.first?.stringValue ?? ""
            title = parentCategory
            if genres?.count ?? 0 > 1 {
                let childCategory = genres?[1].stringValue ?? ""
                title += ": \(childCategory)"
            }
            return title
        }
    }
    
    var size: String {
        return fileSizeBytes?.sizeOfFileWithUnit ?? ""
    }
    
    var language: String {
        let firstLanguage = languageCodesISO2A?.first ?? ""
        if languageCodesISO2A?.count ?? 0 > 1 {
            return "\(firstLanguage) and \(languageCodesISO2A?.count ?? 0) more"
        }
        return firstLanguage
    }
    
    var languageCount: String {
        let firstLanguage = languageCodesISO2A?.first ?? ""
        if languageCodesISO2A?.count ?? 0 > 1 {
            return "+ \(languageCodesISO2A?.count ?? 0) More"
        }
        return firstLanguage
    }
    
    var languages: String? {
        if languageCodesISO2A?.count ?? 0 <= 1 { return nil }
        var value = ""
        languageCodesISO2A?.forEach { language in
            value += language
            if languageCodesISO2A?.last != language {
                value += ", "
            }
        }
        return value
    }
    
    var ageRating: String? {
        var value = (trackContentRating ?? "")
        if advisories?.count ?? 0 >= 1 {
            value += "\n"
        }
        advisories?.forEach { advisory in
            value += advisory
            if advisories?.last != advisory {
                value += "\n"
            }
        }
        return value
    }
}

enum GenresValue: Codable {
    case string(String)
    case genre(Genre)

    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if let x = try? container.decode(String.self) {
            self = .string(x)
            return
        }
        if let x = try? container.decode(Genre.self) {
            self = .genre(x)
            return
        }
        throw DecodingError.typeMismatch(GenresValue.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for GenresValue"))
    }

    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        switch self {
        case .string(let x):
            try container.encode(x)
        case .genre(let x):
            try container.encode(x)
        }
    }
    
    var genreValue: Genre? {
        switch self {
        case .genre(let g):
            return g
        default:
            return nil
        }
    }

    var stringValue: String? {
        switch self {
        case .string(let s):
            return s
        default:
            return nil
        }
    }
}
