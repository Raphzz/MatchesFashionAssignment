//
//  CurrencyRate.swift
//  MatchesFashionAssignment
//
//  Created by Raphael Pedrini on 27/07/2021.
//

// MARK: - CurrencyRate

struct CurrencyRate: Codable {
    let base: String
    let target: String
    let conversionRate: Double
    
    enum CodingKeys: String, CodingKey {
        case base = "base_code"
        case target = "target_code"
        case conversionRate = "conversion_rate"
    }
}
