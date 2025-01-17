//
//  AppCoordinator.swift
//  WeeklyNewTrends
//
//  Created by Raphael Velasqua on 20/07/2021.
//

import Foundation
import UIKit

class AppCoordinator: Coordinator {
	
	var window: UIWindow
	var navigation: UINavigationController
	
	init(window: UIWindow, navigation: UINavigationController)
	{
		self.navigation = navigation
		self.window = window
		window.rootViewController = emptyState()
		window.backgroundColor = .themeMain
		window.makeKeyAndVisible()
	}
	
	func start()
	{
        let listCoordinator = ProductListCoordinator(navigation: navigation, weeklyTrendService: WomenWearService(), currencyConverterService: CurrencyConverterService())
		listCoordinator.start()
		window.rootViewController = listCoordinator.navigation
	}
	
	private func emptyState() -> UIViewController {
		let viewController = UIViewController()
		viewController.view.backgroundColor = .themeMain
		return viewController
	}
}

