//
//  MainCoordinator.swift
//  WeeklyNewTrends
//
//  Created by Raphael Velasqua on 20/07/2021.
//

import UIKit

class ProductListCoordinator: Coordinator{
	
	var detailCoordinator: ProductDetailCoordinator?
	let womenWearService: WomenWearServiceProtocol
    let currencyConverterService: CurrencyConverterServiceProtocol
    var navigation: UINavigationController
	
    init(navigation: UINavigationController, weeklyTrendService: WomenWearServiceProtocol, currencyConverterService: CurrencyConverterServiceProtocol) {
		self.womenWearService = weeklyTrendService
        self.currencyConverterService = currencyConverterService
		self.navigation = navigation
	}
	
	func start() {
        let viewModel = ProductListViewModel(withWomenWearService: womenWearService, and: currencyConverterService)
		viewModel.coordinatorDelegate = self
		let productListVC = ProductsListController(productListViewModel: viewModel)
		navigation.viewControllers = [productListVC]
	}
}

extension ProductListCoordinator: ProductDetailCoordinatorDelegate {
	func detailCoordinatorDidFinish(detailCoordinator: ProductDetailCoordinator) {
		self.detailCoordinator = nil
		navigation.popToRootViewController(animated: true)
	}
}

extension ProductListCoordinator: ProductListViewModelCoordinatorDelegate {
	func productDidSelect(data: ProductCellViewModel) {
		detailCoordinator = ProductDetailCoordinator(navigation: navigation, product: data)
		detailCoordinator?.start()
	}
}

