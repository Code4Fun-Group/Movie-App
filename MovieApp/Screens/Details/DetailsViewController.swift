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
		tableView.delegate = self
		tableView.dataSource = self
	}
}

private extension DetailsViewController {
	func setupUI() {
		tableView.register(UINib(nibName: Constants.detailTBVC, bundle: Bundle.main), forCellReuseIdentifier: Constants.detailTBVC)
		tableView.register(UINib(nibName: Constants.moreTBVC, bundle: Bundle.main), forCellReuseIdentifier: Constants.moreTBVC)
	}
}

// MARK: - UITableViewDataSource
extension DetailsViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		1
	}

	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		switch indexPath.section {
		case 0:
			guard let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.detailTBVC) as? DetailTableViewCell else { return UITableViewCell() }
//			cell.configure(cellViewModel: viewModel?.movieViewModels.last)
			return cell
		case 1:
			guard let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.moreTBVC) as? MoreTableViewCell else { return UITableViewCell() }
//			cell.configure(cellViewModel: viewModel?.movieViewModels.last)
			return cell

		default:
			guard let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.detailTBVC) as? DetailTableViewCell else { return UITableViewCell() }
//			cell.configure(cellViewModel: viewModel?.movieViewModels.last)
			return cell
		}
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch indexPath.section {
		case 0:
			return 450.0
		case 1:
			return 230.0
		default:
			return 200.0
		}
	}

	func numberOfSections(in tableView: UITableView) -> Int {
		2
	}
}

// MARK: - UITableViewDelegate
extension DetailsViewController: UITableViewDelegate {

}
