//
//  ProductsViewController.swift
//  WeeklyNewTrends
//
//  Created by Raphael Velasqua on 20/07/2021.
//

import UIKit
import SnapKit

class ProductsListController: UIViewController, UIActionSheetDelegate {
	
	var viewModel: ProductListViewModel
    
    private let availableCurrencies: [AvailableCurrency] = [.usd, .euro, .chineseYuan, .swissFranc, .australianDollar]
	
	lazy var productCollectionView: UICollectionView = {
		let layout = UICollectionViewFlowLayout()
		let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
		return collectionView
	}()
	
	init(productListViewModel: ProductListViewModel) {
		self.viewModel = productListViewModel
		super.init(nibName: nil, bundle: nil)
	}
    
	required init?(coder: NSCoder) {
		fatalError("init(coder:) has not been implemented")
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		setupCollectionView()
		viewModel.viewDelegate = self
		viewModel.getWeeklyTrendProducts()
	}
    
    private func refreshDisplay() {
		DispatchQueue.main.async { [self] in
			title = viewModel.title
            addCurrencyConverterButton()
			productCollectionView.reloadData()
		}
	}
    
    private func addCurrencyConverterButton() {
        let currencyButton = UIBarButtonItem(title: "Currency", style: .plain, target: self, action: #selector(changeCurrencyTap))
        navigationItem.rightBarButtonItem = currencyButton
    }
    
    @objc func changeCurrencyTap() {
        let alertController = UIAlertController(title: nil, message: "Select preferred currency", preferredStyle: .actionSheet)

        _ = availableCurrencies.map { availableCurrency in
            return UIAlertAction(title: availableCurrency.rawValue, style: .default, handler: { (alert: UIAlertAction!) -> Void in
                self.viewModel.getCurrencyRate(for: availableCurrency)
            })
        }.map {
            alertController.addAction($0)
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
        alertController.addAction(cancelAction)
        
        self.present(alertController, animated: true, completion: nil)
    }
	
	private func setupCollectionView() {
		
		view.addSubview(productCollectionView)
		productCollectionView.contentInset = UIEdgeInsets(top: 10, left: viewModel.cellPadding, bottom: 10, right: viewModel.cellPadding)
		
		productCollectionView.snp.makeConstraints {
			$0.edges.equalToSuperview()
		}
		
		productCollectionView.register(ProductCell.self)
		
		productCollectionView.dataSource = self
		productCollectionView.delegate = self
		productCollectionView.backgroundColor = .themeMain
	}
	
}

extension ProductsListController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		viewModel.didSelectItemAtIndex((indexPath as NSIndexPath).row)
	}
}

extension ProductsListController: UICollectionViewDataSource {
	
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel.numberOfItems
	}
	
	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		let cell = collectionView.dequeueReusableCell(forIndexPath: indexPath) as ProductCell
		guard let viewModel = viewModel.productCellViewModel(at: indexPath) else { return cell }
		cell.config(withViewModel: viewModel)
		return cell
	}
	
}

extension ProductsListController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: (collectionView.frame.width / CGFloat(viewModel.itemsPerRow) - (viewModel.cellPadding * 2)), height: collectionView.frame.height/2.5)
	}
}

extension ProductsListController: ProductListViewModelDelegate {
	func productsDidLoad() {
		refreshDisplay()
	}
}
