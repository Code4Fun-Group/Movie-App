//
//  MoreViewController.swift
//  MovieApp
//
//  Created by MinhDev on 10/6/21.
//

import UIKit
import StoreKit

private enum ConstantsCellMore {
	static let profileCell = "ProfileTableViewCell"
	static let sharedCell = "SharedTableViewCell"
	static let myListCell = "MyListTableViewCell"
	static let standardCell = "StandardTableViewCell"
}

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
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		viewModel?.getMore()
	}
}

// MARK: - Private function
private extension MoreViewController {

	func setupUI() {
		moreTableView.register(UINib(nibName: ConstantsCellMore.profileCell, bundle: Bundle.main), forCellReuseIdentifier: ConstantsCellMore.profileCell)
		moreTableView.register(UINib(nibName: ConstantsCellMore.sharedCell, bundle: Bundle.main), forCellReuseIdentifier: ConstantsCellMore.sharedCell)
		moreTableView.register(UINib(nibName: ConstantsCellMore.myListCell, bundle: Bundle.main), forCellReuseIdentifier: ConstantsCellMore.myListCell)
		moreTableView.register(UINib(nibName: ConstantsCellMore.standardCell, bundle: Bundle.main), forCellReuseIdentifier: ConstantsCellMore.standardCell)
	}
}

// MARK: - IDownloadViewController
extension MoreViewController: IMoreViewController {

	func showError(_ errorMessage: String) {
		print(errorMessage)
	}

	func showMovies() {
		moreTableView.reloadData()
	}
}

// MARK: - UITableViewDataSource
extension MoreViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return viewModel?.sectionsMore.count ?? 0
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let tabCell = viewModel?.sectionsMore[indexPath.section]
		switch tabCell {
		case .profile(let identifer, _):
			guard let cell = self.moreTableView.dequeueReusableCell(withIdentifier: identifer) as? ProfileTableViewCell else { return UITableViewCell() }
			cell.configure(with: viewModel?.moreViewModels ?? [])
			return cell

		case .shared(let identifer, _):
			guard let cell = self.moreTableView.dequeueReusableCell(withIdentifier: identifer) as? SharedTableViewCell else { return UITableViewCell() }
			cell.viewModelShared = self
			return cell

		case .mylist(let identifer, _):
			guard let cell = self.moreTableView.dequeueReusableCell(withIdentifier: identifer) as? MyListTableViewCell else { return UITableViewCell() }
			return cell

		case .appsetting(let identifer, let title):
			guard let cell = self.moreTableView.dequeueReusableCell(withIdentifier: identifer) as? StandardTableViewCell else { return UITableViewCell() }
			cell.configure(cellViewModel: title)
			return cell

		case .account(let identifer, let title):
			guard let cell = self.moreTableView.dequeueReusableCell(withIdentifier: identifer) as? StandardTableViewCell else { return UITableViewCell() }
			cell.configure(cellViewModel: title)
			return cell

		case .help(let identifer, let title):
			guard let cell = self.moreTableView.dequeueReusableCell(withIdentifier: identifer) as? StandardTableViewCell else { return UITableViewCell() }
			cell.configure(cellViewModel: title)
			return cell

		case .signout(let identifer, let title):
			guard let cell = self.moreTableView.dequeueReusableCell(withIdentifier: identifer) as? StandardTableViewCell else { return UITableViewCell() }
			cell.configure(cellViewModel: title)
			return cell
			
		case .none:
			return UITableViewCell()
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
