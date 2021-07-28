//
//  ProductCellViewModelTests.swift
//  MatchesFashionAssignmentTests
//
//  Created by Raphael Pedrini on 28/07/2021.
//

import XCTest
@testable import MatchesFashionAssignment

class ProductDetailViewModelTests: XCTestCase {
    
    let mockCurrency = Currency(name: AvailableCurrency.pound.rawValue, currencyRate: 1)
    
    let mockProduct = DecodableHelper.decode(WomenWearResponse.self, jsonData: MockResponseHelper().processJsonData(for: .validJsonResponse))!.products.first!
    
    let mockViewModelDelegate = ProductDetailViewModelDelegateMock()
    
    var mockViewModel: ProductDetailViewModelProtocol!
    
    override func setUp() {
        mockViewModel = ProductDetailViewModel()
        mockViewModel.viewDelegate = mockViewModelDelegate
    }
    
    func testDidCallDetailDidLoad() {
        mockViewModel.product = ProductCellViewModel(withProduct: mockProduct, withCurrency: mockCurrency)
        XCTAssertTrue(mockViewModelDelegate.didCallDetailDidLoad)
    }
}

class ProductDetailViewModelDelegateMock: ProductDetailViewModelDelegate {
    
    var didCallDetailDidLoad = false
    
    func detailDidLoad(viewModel: ProductDetailViewModelProtocol) {
        didCallDetailDidLoad = true
    }
}
