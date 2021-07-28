//
//  ProductDetailCoordinator.swift
//  WeeklyNewTrends
//
//  Created by Raphael Velasqua on 20/07/2021.
//

import UIKit

protocol ProductDetailCoordinatorDelegate: AnyObject {
	func detailCoordinatorDidFinish(detailCoordinator: ProductDetailCoordinator)
}

class ProductDetailCoordinator: Coordinator {
	
	let productViewModel: ProductCellViewModel
    var navigation: UINavigationController
	
	init(navigation: UINavigationController, product: ProductCellViewModel)
	{
		self.navigation = navigation
		self.productViewModel = product
	}
	
	func start()
	{
		let productDetailVC = ProductsDetailController()
		let viewModel = ProductDetailViewModel()
		productDetailVC.viewModel = viewModel
		viewModel.product = self.productViewModel
		navigation.pushViewController(productDetailVC, animated: true)
	}
}
