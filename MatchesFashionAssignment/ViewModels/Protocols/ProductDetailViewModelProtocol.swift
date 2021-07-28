//
//  ProductDetailViewModelProtocol.swift
//  WeeklyNewTrends
//
//  Created by Raphael Velasqua on 20/07/2021.
//

import Foundation

protocol ProductDetailViewModelDelegate: AnyObject {
	func detailDidLoad(viewModel: ProductDetailViewModelProtocol)
}

protocol ProductDetailViewModelProtocol {
	var product: ProductCellViewModel? { get set }
	var viewDelegate: ProductDetailViewModelDelegate? { get set }
}
