//
//  MockResponseHelper.swift
//  WeeklyNewTrends
//
//  Created by Raphael Velasqua on 20/07/2021.
//


import Foundation

enum MockResponseType: String {
	case invalidJsonResponse = "WomenWearInvalidResponse"
	case validJsonResponse = "WomenWearValidResponse"
	case emptyJsonResponse = "WomenWearEmptyResponse"
    case currencyConvertValidResponse = "CurrencyConverterValidResponse"
}

class MockResponseHelper {
	
	func processJsonData(for responseType: MockResponseType) -> Data {
		guard let path = Bundle(for: type(of: self)).url(forResource: responseType.rawValue, withExtension: "json"),
			let result = try? Data(contentsOf: path) else { return Data() }
		return result
	}
}
