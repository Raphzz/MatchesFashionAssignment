//
//  ProductDetailViewTests.swift
//  WeeklyNewTrendsTests
//
//  Created by Raphael Velasqua on 20/07/2021.
//
import XCTest

@testable import MatchesFashionAssignment

class ProductDetailViewTests: XCTestCase {

	func testInitWithCoderShouldBeNil() {
		XCTAssertNil(ProductDetailView(coder: NSCoder()))
	}
}
