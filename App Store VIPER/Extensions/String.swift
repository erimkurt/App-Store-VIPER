//
//  String.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//

import Foundation

extension String {
    var sizeOfFileWithUnit: String {
        let size = ByteCountFormatter.string(fromByteCount: Int64(self) ?? 0, countStyle: .file)
        return size
    }
    
    var sizeOfFileUnit: String {
        let formatter = ByteCountFormatter()
        formatter.includesCount = false
        formatter.countStyle = .file
        return formatter.string(fromByteCount: Int64(self) ?? 0)
    }
    
    var sizeOfFile: String {
        let formatter = ByteCountFormatter()
        formatter.includesUnit = false
        formatter.countStyle = .file
        return formatter.string(fromByteCount: Int64(self) ?? 0)
    }
}
