//
//  ProductCellViewModel.swift
//  WeeklyNewTrends
//
//  Created by Raphael Velasqua on 20/07/2021.
//

import Foundation

protocol ProductCellViewModelProtocol {
	var product: Product { get }
    var currency: Currency { get }
}

extension ProductCellViewModelProtocol {
	
	func productName() -> String {
		return product.name
	}
	
	func productImage() -> URL? {
        return product.image.medium.url
	}
    
    func productThumbnail() -> URL? {
        return product.image.thumbnail.url
    }
	
	func productPrice() -> String {
        let price = Double(product.price.value) * currency.currencyRate
        
        return String(format: "%.02f", price)
	}
}
