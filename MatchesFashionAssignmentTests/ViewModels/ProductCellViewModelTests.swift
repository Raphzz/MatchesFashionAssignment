//
//  ProductCellViewModelTests.swift
//  MatchesFashionAssignmentTests
//
//  Created by Raphael Pedrini on 28/07/2021.
//

import XCTest
@testable import MatchesFashionAssignment

class ProductCellViewModelTests: XCTestCase {
    
    let mockCurrency = Currency(name: AvailableCurrency.pound.rawValue, currencyRate: 1)
    
    let mockProduct = DecodableHelper.decode(WomenWearResponse.self, jsonData: MockResponseHelper().processJsonData(for: .validJsonResponse))!.products.first!
    
    var mockProductCellViewModel: ProductCellViewModelProtocol!
    
    override func setUp() {
        mockProductCellViewModel = ProductCellViewModel(withProduct: mockProduct, withCurrency: mockCurrency)
    }
    
    func testProductName() {
        XCTAssertTrue(mockProductCellViewModel.productName() == "Floral Shirt")
    }
    
    func testProductImage() {
        XCTAssertTrue(mockProductCellViewModel.productImage() == URL(string: "https://assetsprx.matchesfashion.com/img/product/1419289_1_medium.jpg"))
    }
    
    func testProductPrice() {
        let price = 925.0
        let formattedString = String(format: "%.02f", price)
        
        XCTAssertTrue(mockProductCellViewModel.productPrice() == formattedString)
    }
}
