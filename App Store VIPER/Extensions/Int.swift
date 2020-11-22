//
//  Int.swift
//  App Store VIPER
//
//  Created by Erim Kurt on 14/11/2563 BE.
//

import Foundation

extension Int {
    
    func formatUsingAbbrevation() -> String {
        let numFormatter = NumberFormatter()
        typealias Abbrevation = (threshold: Double, divisor: Double, suffix: String)
        
        let abbreviations: [Abbrevation] = [(0, 1, ""),
                                           (1000.0, 1000.0, "k"),
                                           (100_000.0, 1_000_000.0, "m"),
                                           (100_000_000.0, 1_000_000_000.0, "b")]
        
        let startValue = Double(abs(self))
        let abbreviation: Abbrevation = {
            var prevAbbreviation = abbreviations[0]
            for tmpAbbreviation in abbreviations {
                if (startValue < tmpAbbreviation.threshold) {
                    break
                }
                prevAbbreviation = tmpAbbreviation
            }
            return prevAbbreviation
        }()
        
        let value = Double(self) / abbreviation.divisor
        numFormatter.positiveSuffix = abbreviation.suffix
        numFormatter.negativeSuffix = abbreviation.suffix
        numFormatter.allowsFloats = true
        numFormatter.minimumIntegerDigits = 1
        numFormatter.minimumFractionDigits = 0
        numFormatter.maximumFractionDigits = 1
        
        return numFormatter.string(from: NSNumber(value: value)) ?? "0"
    }
}
