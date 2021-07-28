//
//  ProductsDetailController.swift
//  WeeklyNewTrends
//
//  Created by Raphael Velasqua on 20/07/2021.
//

import UIKit
import SnapKit

class ProductsDetailController: UIViewController {
	
	let detailContentView = ProductDetailView()
	var viewModel: ProductDetailViewModel? {
		willSet {
			viewModel?.viewDelegate = nil
		}
		didSet {
			viewModel?.viewDelegate = self
		}
	}
	override func loadView() {
		view = detailContentView
	}
	init() {
		super.init(nibName: nil, bundle: nil)
	}
	
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		self.view.backgroundColor = .white
	}
    
	func refreshDisplay() {
        guard let dataViewModel = viewModel?.product else { return }
		detailContentView.config(withViewModel: dataViewModel)
	}
}

extension ProductsDetailController: ProductDetailViewModelDelegate {
	func detailDidLoad(viewModel: ProductDetailViewModelProtocol) {
		refreshDisplay()
	}
}
