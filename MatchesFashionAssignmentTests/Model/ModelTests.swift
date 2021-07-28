//
//  ProductTests.swift
//  WeeklyNewTrends
//
//  Created by Raphael Velasqua on 20/07/2021.
//


import XCTest
@testable import MatchesFashionAssignment

class ModelTests: XCTestCase {
	
    let data = MockResponseHelper().processJsonData(for: .validJsonResponse)
    
    var womenWearValidResponse: WomenWearResponse!
    
    override func setUp() {
        womenWearValidResponse = DecodableHelper.decode(WomenWearResponse.self, jsonData: data)
    }
    
    func testProductObjectRepresentation() throws {
        let product = try XCTUnwrap(womenWearValidResponse.products.first)
        let price = try XCTUnwrap(womenWearValidResponse.products.first?.price)
        let galleryImages = try XCTUnwrap(womenWearValidResponse.products.first?.image)
        
        XCTAssertTrue(product.name == "Floral Shirt")
        XCTAssertTrue(price.value == 925)
        XCTAssertTrue(galleryImages.thumbnail.urlPath == "//assetsprx.matchesfashion.com/img/product/1419289_1_thumbnail.jpg")
    }
}
