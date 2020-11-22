//
//  Double.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//

import Foundation

extension Double {
    func isInt() -> Bool {
        guard Double(Int.min) <= self && self <= Double(Int.max) else {
            return false
        }
        return floor(self) == self
    }
    
    func toInt() -> Int? {
        guard Double(Int.min) <= self && self <= Double(Int.max) else {
            return nil
        }
        return Int(self)
    }
}
