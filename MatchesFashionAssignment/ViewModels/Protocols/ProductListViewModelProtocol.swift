//
//  ProductListViewModel.swift
//  WeeklyNewTrends
//
//  Created by Raphael Velasqua on 20/07/2021.
//

import Foundation

protocol ProductListViewModelDelegate: AnyObject {
	func productsDidLoad()
}

protocol ProductListViewModelCoordinatorDelegate: AnyObject {
	func productDidSelect(data: ProductCellViewModel)
}

protocol ProductListViewModelProtocol {
	var title: String { get }
	var data: WomenWearResponse? { get set }
	var numberOfItems: Int { get }
	
	func productCellViewModel(at indexPath: IndexPath) -> ProductCellViewModel?
	func getWeeklyTrendProducts()
	
	var viewDelegate: ProductListViewModelDelegate? { get set }
}
