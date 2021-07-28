//
//  WeeklyTrendsResponse.swift
//  WeeklyNewTrends
//
//  Created by Raphael Velasqua on 20/07/2021.
//

import Foundation

// MARK: - WeeklyTrendsResponse

struct WomenWearResponse: Codable {
	let products: [Product]

	enum CodingKeys: String, CodingKey {
		case products = "results"
	}
}

// MARK: - Product
struct Product: Codable {
	let name: String
    let price: Price
    let image: GalleryImages
    
    enum CodingKeys: String, CodingKey {
        case name, price
        case image = "primaryImageMap"
    }
}

// MARK: - Price
struct Price: Codable {
    let value: Int
    
    enum CodingKeys: String, CodingKey {
        case value
    }
}

// MARK: - GalleryImages
struct GalleryImages: Codable {
    let thumbnail: Image
    let large: Image
    let medium: Image
}

// MARK: - Image
struct Image: Codable {
    let urlPath: String
    
    var url: URL? {
        return URL(string: "https:" + urlPath)
    }
    
    enum CodingKeys: String, CodingKey {
        case urlPath = "url"
    }
}

