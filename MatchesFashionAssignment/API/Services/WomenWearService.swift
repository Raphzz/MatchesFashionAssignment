//
//  WeeklyTrendService.swift
//  WeeklyNewTrends
//
//  Created by Raphael Velasqua on 20/07/2021.
//

import Foundation

class WomenWearService: BaseService {
	
	func fetch (completionHandler: @escaping (Result<WomenWearResponse, ServiceFetchError>) -> Void) {
		
		fetch(result: WomenWearResponse.self, withURL: url(withPath: APIConstants.urls.weeklyTrendProducts)) { (result) in
			switch result {
			case .success(let events):
				completionHandler(Result.success(events))
			case .failure(let error):
				completionHandler(Result.failure(error))
			}
		}
	}
}
