//
//  ProductListViewModelTests.swift
//  MatchesFashionAssignmentTests
//
//  Created by Raphael Pedrini on 28/07/2021.
//

import XCTest
@testable import MatchesFashionAssignment

class ProductListViewModelTests: XCTestCase {
    
    let mockCurrencyService = CurrencyConverterServiceMock()
    let mockWomenWearService = WomenWearServiceMock()
    
    var mockViewModel: ProductListViewModel!
    
    override func setUp() {
        mockViewModel = ProductListViewModel(withWomenWearService: mockWomenWearService, and: mockCurrencyService)
    }
    
    func testViewTitle() {
        XCTAssertTrue(mockViewModel.title == "Women Wear")
    }
    
    func testNumberOfItems() {
        
        // Fetch JSON Mock from mock service
        mockViewModel.getWeeklyTrendProducts()
        
        XCTAssertTrue(mockViewModel.numberOfItems == 1)
    }
    
    func testDefaultCurrency() {
        let gbpCurrency = Currency(name: AvailableCurrency.pound.rawValue, currencyRate: 1)
        
        XCTAssertTrue(mockViewModel.currency.name == gbpCurrency.name)
    }
    
    func testGetProductCellViewModel() throws {
        mockViewModel.getWeeklyTrendProducts()
        
        let firstProduct = try XCTUnwrap(mockViewModel.data?.products.first)
        
        let cellViewModel = try XCTUnwrap(mockViewModel.productCellViewModel(at: IndexPath(row: 0, section: 0)))
        
        XCTAssertTrue(firstProduct.name == cellViewModel.productName())
    }
    
    func testFetchCurrency() {
        mockViewModel.getCurrencyRate(for: .chineseYuan)
        
        let cnyCurrency = Currency(name: AvailableCurrency.chineseYuan.rawValue, currencyRate: 8.9413)
        
        XCTAssertTrue(mockViewModel.currency.name == cnyCurrency.name)
        XCTAssertTrue(mockViewModel.currency.currencyRate == cnyCurrency.currencyRate)
    }
}
