//
//  APIConstants.swift
//  WeeklyNewTrends
//
//  Created by Raphael Velasqua on 20/07/2021.
//

import Foundation
struct APIConstants {
	
    static let currencyConverterAPIKey = "59ed895683aad747ab3ba96e"
    
	static let base = "https://www.matchesfashion.com"
    static let currencyBase = "https://v6.exchangerate-api.com/v6/" + currencyConverterAPIKey
    
    public struct urls {
		public static let weeklyTrendProducts = "/womens/shop?format=json"
        public static let currencyConverter = "/pair/%@/%@"
	}
}
