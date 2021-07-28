//
//  CurrencyConverterServiceMock.swift
//  MatchesFashionAssignmentTests
//
//  Created by Raphael Pedrini on 28/07/2021.
//

@testable import MatchesFashionAssignment

class CurrencyConverterServiceMock: BaseService, CurrencyConverterServiceProtocol {
    
    var isSuccessModeOn = true
    
    let currencyConverterValidResponse = DecodableHelper.decode(CurrencyRate.self, jsonData: MockResponseHelper().processJsonData(for: .currencyConvertValidResponse))
    
    func fetch(currencyName: String, completionHandler: @escaping (Result<CurrencyRate, ServiceFetchError>) -> Void) {
        
        if isSuccessModeOn {
            completionHandler(Result.success(currencyConverterValidResponse!))
        } else {
            completionHandler(Result.failure(ServiceFetchError.invalidJSON))
        }
    }
}
