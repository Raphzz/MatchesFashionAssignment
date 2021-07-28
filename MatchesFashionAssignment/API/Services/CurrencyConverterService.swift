//
//  CurrencyConverterService.swift
//  MatchesFashionAssignment
//
//  Created by Raphael Pedrini on 27/07/2021.
//

import Foundation

protocol CurrencyConverterServiceProtocol {
    func fetch (currencyName: String, completionHandler: @escaping (Result<CurrencyRate, ServiceFetchError>) -> Void)
}

class CurrencyConverterService: BaseService, CurrencyConverterServiceProtocol {
    func fetch (currencyName: String, completionHandler: @escaping (Result<CurrencyRate, ServiceFetchError>) -> Void) {
        
        fetch(result: CurrencyRate.self, withURL: url(withPath: String(format: APIConstants.urls.currencyConverter, "GBP", currencyName))) { (result) in
            switch result {
            case .success(let events):
                completionHandler(Result.success(events))
            case .failure(let error):
                completionHandler(Result.failure(error))
            }
        }
    }
}
