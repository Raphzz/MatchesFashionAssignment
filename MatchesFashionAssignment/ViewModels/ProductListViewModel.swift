//
//  ProductListViewModel.swift
//  WeeklyNewTrends
//
//  Created by Raphael Velasqua on 20/07/2021.
//

import UIKit

enum AvailableCurrency: String {
    case pound = "GBP"
    case euro = "EUR"
    case usd = "USD"
    case australianDollar = "AUD"
    case chineseYuan = "CNY"
    case swissFranc = "CHF"
}

class ProductListViewModel: ProductListViewModelProtocol {
	
    var selectedCurrency: AvailableCurrency = .pound
    
	var title: String {
		return "Women Wear"
	}
    
    var numberOfItems: Int {
		if let items = data {
            return items.products.count
		}
		return 0
	}
	
    internal var currency = Currency(name: AvailableCurrency.pound.rawValue, currencyRate: 1) {
        didSet {
            viewDelegate?.productsDidLoad()
        }
    }
    
	internal var data: WomenWearResponse? {
		didSet {
			viewDelegate?.productsDidLoad()
		}
	}
	
	var viewDelegate: ProductListViewModelDelegate?
	var coordinatorDelegate: ProductListViewModelCoordinatorDelegate?
    
	private let womenWearService: WomenWearServiceProtocol
    private let currencyConverterService: CurrencyConverterServiceProtocol
	
    let itemsPerRow: Int = 2
	let cellPadding: CGFloat = 15.0
	
    init(withWomenWearService womenWearService: WomenWearServiceProtocol, and currencyConverterService: CurrencyConverterServiceProtocol) {
		self.womenWearService = womenWearService
        self.currencyConverterService = currencyConverterService
	}
    
    func getCurrencyRate(for currency: AvailableCurrency) {
        currencyConverterService.fetch(currencyName: currency.rawValue) { [weak self] (result) in
            switch result{
            case .success(let response):
                let currencyRate = response
                self?.currency = Currency(name: currency.rawValue, currencyRate: currencyRate.conversionRate)
            case .failure(let error):
                DLog(error.localizedDescription)
            }
        }
    }
	
	func getWeeklyTrendProducts() {
        womenWearService.fetch { [weak self] (result) in
			switch result{
			case .success(let response):
				self?.data = response
			case .failure(let error):
				DLog(error.localizedDescription)
			}
		}
	}
	
}

// MARK: - TableView Data Fetch

extension ProductListViewModel {
	
	func productCellViewModel(at indexPath: IndexPath) -> ProductCellViewModel? {
		if let items = data?.products {
			return ProductCellViewModel(withProduct: items[indexPath.row], withCurrency: currency)
		}
		return nil
	}
	
	func didSelectItemAtIndex(_ index: Int)
	{
		if let items = data?.products,
		   let coordinatorDelegate = coordinatorDelegate,
		   index < items.count {
                coordinatorDelegate.productDidSelect(data: ProductCellViewModel(withProduct: items[index], withCurrency: currency))
		}
	}
}
