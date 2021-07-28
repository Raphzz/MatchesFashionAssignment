//
//  ProductListCoordinator.swift
//  MatchesFashionAssignmentTests
//
//  Created by Raphael Pedrini on 28/07/2021.
//

import XCTest
@testable import MatchesFashionAssignment

class ProductListCoordinatorTests: XCTestCase {
    let navigationController = UINavigationController()
    
    var mockCoordinator: ProductListCoordinator?
    
    override func setUp() {
        mockCoordinator = ProductListCoordinator(navigation: navigationController, weeklyTrendService: WomenWearServiceMock(), currencyConverterService: CurrencyConverterServiceMock())
    }
    
    func testStart() {
        let mockViewModel = ProductListViewModel(withWomenWearService: WomenWearServiceMock(), and: CurrencyConverterServiceMock())
        let mockViewController = ProductsListController(productListViewModel: mockViewModel)
        
        navigationController.viewControllers = [mockViewController]
        
        XCTAssertTrue(navigationController.viewControllers.first == mockViewController)
    }
}
