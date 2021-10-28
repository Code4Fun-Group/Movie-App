//
//  MoreViewController.swift
//  MovieApp
//
//  Created by MinhDev on 10/6/21.
//

import UIKit
import StoreKit

protocol IMoreViewController: AnyObject {
	func showMovies()
	func showError(_ errorMessage: String)
}

class MoreViewController: BaseViewController {
// MARK: - Iboutlets
	@IBOutlet private weak var moreTableView: UITableView!

// MARK: - Variables
	private var viewModel: MoreViewModel?

// MARK: - Life cycles
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel = MoreViewModel(viewController: self)

		self.moreTableView.delegate = self
		self.moreTableView.dataSource = self
		setupUI()
		setupTableView()
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		viewModel?.getMore()
	}
}

// MARK: - Private function
private extension MoreViewController {
	func setupUI() {
	}

	func setupTableView() {
		moreTableView.register(UINib(nibName: ConstantsCellMore.profileCell, bundle: Bundle.main), forCellReuseIdentifier: ConstantsCellMore.profileCell)
		moreTableView.register(UINib(nibName: ConstantsCellMore.sharedCell, bundle: Bundle.main), forCellReuseIdentifier: ConstantsCellMore.sharedCell)
		moreTableView.register(UINib(nibName: ConstantsCellMore.myListCell, bundle: Bundle.main), forCellReuseIdentifier: ConstantsCellMore.myListCell)
		moreTableView.register(UINib(nibName: ConstantsCellMore.standardCell, bundle: Bundle.main), forCellReuseIdentifier: ConstantsCellMore.standardCell)
	}
}

// MARK: - IDownloadViewController
extension MoreViewController: IMoreViewController {

	func showError(_ errorMessage: String) {
	}

	func showMovies() {
		moreTableView.reloadData()
	}
}

// MARK: - UITableViewDataSource
extension MoreViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return MoreCell.allCases.count
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let tabCell = MoreCell.allCases[indexPath.section]
		switch tabCell {
		case .detail:
			guard let cell = self.moreTableView.dequeueReusableCell(withIdentifier: ConstantsCellMore.profileCell) as? ProfileTableViewCell else { return UITableViewCell() }
			cell.configure(with: viewModel?.moreViewModels ?? [])
			return cell

		case .shared:
			guard let cell = self.moreTableView.dequeueReusableCell(withIdentifier: ConstantsCellMore.sharedCell) as? SharedTableViewCell else { return UITableViewCell() }
			cell.viewModel = self
			return cell

		case .mylist:
			guard let cell = self.moreTableView.dequeueReusableCell(withIdentifier: ConstantsCellMore.myListCell) as? MyListTableViewCell else { return UITableViewCell() }
			return cell

		case .appsetting:
			guard let cell = self.moreTableView.dequeueReusableCell(withIdentifier: ConstantsCellMore.standardCell) as? StandardTableViewCell else { return UITableViewCell() }
			cell.configure(cellViewModel: MoreCell.title(MoreCell.appsetting)())
			return cell

		case .account:
			guard let cell = self.moreTableView.dequeueReusableCell(withIdentifier: ConstantsCellMore.standardCell) as? StandardTableViewCell else { return UITableViewCell() }
			cell.configure(cellViewModel: MoreCell.title(MoreCell.account)())
			return cell

		case .help:
			guard let cell = self.moreTableView.dequeueReusableCell(withIdentifier: ConstantsCellMore.standardCell) as? StandardTableViewCell else { return UITableViewCell() }
			cell.configure(cellViewModel: MoreCell.title(MoreCell.help)())
			return cell

		case .signout:
			guard let cell = self.moreTableView.dequeueReusableCell(withIdentifier: ConstantsCellMore.standardCell) as? StandardTableViewCell else { return UITableViewCell() }
			cell.configure(cellViewModel: MoreCell.title(MoreCell.signout)())
			return cell
			
		}
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch indexPath.section {
		case 0:
			return 200.0
		case 1:
			return 200.0
		default:
			return 50.0
		}
	}
}

// MARK: - UITableViewDelegate
extension MoreViewController: UITableViewDelegate {
}

extension MoreViewController: sharedDelegate {
	
	func sharedAlert() {
		let alert = UIAlertController(title: "Copy Link ", message: " You have copied successfully ", preferredStyle: .alert)
		let okAction = UIAlertAction(title: "OK", style: .cancel)
		alert.addAction(okAction)
		present(alert, animated: true)
	}

	 func sharedFacebook() {
		view.reloadInputViews()
		guard let url = URL(string: "ms-facebook://") else { return }
		if UIApplication.shared.canOpenURL(url) {
			UIApplication.shared.open(url, options: [:], completionHandler: nil)
		} else {
			let view = SKStoreProductViewController()
			view.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier: NSNumber(value: 284882215)], completionBlock: nil)
			self.navigationController?.present(view, animated: true, completion: nil)
		}
	}
	
	func sharedGmail() {
	   view.reloadInputViews()
	   guard let url = URL(string: "ms-gmail://") else { return }
	   if UIApplication.shared.canOpenURL(url) {
		   UIApplication.shared.open(url, options: [:], completionHandler: nil)
	   } else {
		   let view = SKStoreProductViewController()
		   view.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier: NSNumber(value: 422689480)], completionBlock: nil)
		   self.navigationController?.present(view, animated: true, completion: nil)
	   }
	}

	func sharedWhatApps() {
	   view.reloadInputViews()
	   guard let url = URL(string: "ms-whatapps://") else { return }
	   if UIApplication.shared.canOpenURL(url) {
		   UIApplication.shared.open(url, options: [:], completionHandler: nil)
	   } else {
		   let view = SKStoreProductViewController()
		   view.loadProduct(withParameters: [SKStoreProductParameterITunesItemIdentifier: NSNumber(value: 310633997)], completionBlock: nil)
		   self.navigationController?.present(view, animated: true, completion: nil)
	   }
	}
}
