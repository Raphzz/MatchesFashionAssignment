//
//  ServiceTests.swift
//  WeeklyNewTrends
//
//  Created by Raphael Velasqua on 20/07/2021.
//


import XCTest
import Foundation
@testable import MatchesFashionAssignment

class ServiceTests: XCTestCase {
	
	var sut: BaseService!
	var session = MockURLSession()
	let url = URL(string: "http://www.github.com")!
	var error: ServiceFetchError?
	
	override func setUp() {
		super.setUp()
		sut = BaseService(session: session)
		error = nil
	}
	
	func testSessionURL() {
		sut.fetch(result: WomenWearResponse.self, withURL: url) { (_) in}
		XCTAssert(session.lastURL == url)
	}

	func testResponseError() {
		sut.fetch(result: WomenWearResponse.self, withURL: url) { (result) in
			switch result {
			case .success(let events):
				XCTAssertNil(events)
			case .failure(let error):
				XCTAssertNotNil(error)
			}
		}
	}
    
	func testResumeCalled() {
		let dataTask = MockURLSessionDataTask()
		session.nextDataTask = dataTask

		sut.fetch(result: WomenWearResponse.self, withURL: url) { (_) in}

		XCTAssert(dataTask.resumeWasCalled)
	}

	func testInvalidURL() {

		sut.fetch(result: WomenWearResponse.self, withURL: nil) { (response) in
			switch response {
			case .failure(let error):
				XCTAssertEqual(error, ServiceFetchError.invalidURL)
			default: break
			}
		}
	}

	func testWithError() {
		session.nextError = .networkFailed
		sut.fetch(result: WomenWearResponse.self, withURL: url) { (response) in
			switch response {
			case .failure(let error):
				XCTAssertEqual(error, .networkFailed)
			default: break
			}
		}
	}

	func testInvalidResponse() {

		let exp = expectation(description: "Got an Invalid response")

		session.nextData = MockResponseHelper().processJsonData(for: .invalidJsonResponse)
		sut.fetch(result: WomenWearResponse.self, withURL: url) { (result) in
			switch result {
			case .success(let data):
				XCTAssertEqual(data.products.count , 0)
			case .failure(let error):
				XCTAssertTrue(error == .decodingError)
			}
			exp.fulfill()
		}

		waitForExpectations(timeout: 1.0, handler: nil)
	}

	func testValidResponse() {

		let exp = expectation(description: "Got valid response")

		session.nextData = MockResponseHelper().processJsonData(for: .validJsonResponse)
		sut.fetch(result: WomenWearResponse.self, withURL: url) { (response) in
			switch response {
			case .success(let data):
				XCTAssertFalse(data.products.isEmpty)
			case .failure(let error):
				XCTAssertNil(error)
			}
			exp.fulfill()
		}

		waitForExpectations(timeout: 1.0, handler: nil)
	}
}
