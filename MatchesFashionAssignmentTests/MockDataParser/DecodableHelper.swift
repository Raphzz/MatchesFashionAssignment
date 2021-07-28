//
//  DecodingHelper.swift
//  WeeklyNewTrends
//
//  Created by Raphael Velasqua on 20/07/2021.
//


import Foundation

struct DecodableHelper {
	
	static func decode<T: Decodable>(_ decodable: T.Type, jsonData: Data) -> T? {
		return try? JSONDecoder().decode(T.self, from: jsonData)
	}
}
