//
//  WomenWearServiceMock.swift
//  MatchesFashionAssignmentTests
//
//  Created by Raphael Pedrini on 28/07/2021.
//

@testable import MatchesFashionAssignment

class WomenWearServiceMock: BaseService, WomenWearServiceProtocol {
    
    var isSuccessModeOn = true
    
    let womenWearValidResponse = DecodableHelper.decode(WomenWearResponse.self, jsonData: MockResponseHelper().processJsonData(for: .validJsonResponse))
    
    func fetch (completionHandler: @escaping (Result<WomenWearResponse, ServiceFetchError>) -> Void) {
        
        if isSuccessModeOn {
            completionHandler(Result.success(womenWearValidResponse!))
        } else {
            completionHandler(Result.failure(ServiceFetchError.invalidJSON))
        }
    }
}
