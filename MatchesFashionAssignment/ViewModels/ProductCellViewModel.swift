//
//  ProductCollectionCellViewModel.swift
//  WeeklyNewTrends
//
//  Created by Raphael Velasqua on 20/07/2021.
//

import Foundation

class ProductCellViewModel: ProductCellViewModelProtocol {
	
	let product: Product
    let currency: Currency
	
    init(withProduct product: Product, withCurrency currency: Currency) {
		self.product = product
        self.currency = currency
	}
}
