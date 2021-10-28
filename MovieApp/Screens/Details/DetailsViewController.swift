//
//  DetailsViewController.swift
//  MovieApp
//
//  Created by MinhDev on 10/6/21.
//

import UIKit

private enum Constants {
	static let detailTBVC = "DetailTableViewCell"
	static let moreTBVC = "MoreTableViewCell"
}

protocol IDetailViewController: AnyObject {
	func showMovies()
	func showError(_ errorMessage: String)
}

class DetailsViewController: BaseViewController {
	// MARK: - IBOutlets
	@IBOutlet weak var tableView: UITableView!

	// MARK: - Life cycles
	override func viewDidLoad() {
	super.viewDidLoad()
		setupUI()
//		tableView.delegate = self
//		tableView.dataSource = self
	}
}

private extension DetailsViewController {
	func setupUI() {
//		tableView.register(UINib(nibName: Constants.detailTBVC, bundle: Bundle.main), forCellReuseIdentifier: Constants.detailTBVC)
//		tableView.register(UINib(nibName: Constants.moreTBVC, bundle: Bundle.main), forCellReuseIdentifier: Constants.moreTBVC)
	}
}
