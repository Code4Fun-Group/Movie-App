//
//  MoreViewController.swift
//  MovieApp
//
//  Created by MinhDev on 10/6/21.
//

import UIKit

protocol IMoreViewController: AnyObject {
	func showMovies()
	func showError(_ errorMessage: String)
}

class MoreViewController: BaseViewController {
// MARK: - Iboutlets
	@IBOutlet private weak var moreTableView: UITableView!
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
		self.moreTableView.backgroundColor = .black
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
//			cell.configure()
//			cell.delegate = self
			return cell
		case .mylist:
			guard let cell = self.moreTableView.dequeueReusableCell(withIdentifier: ConstantsCellMore.myListCell) as? MyListTableViewCell else { return UITableViewCell() }
//			cell.configure(with: viewModel?.movieViewModels ?? [])
//			cell.delegate = self
			return cell
		case .appsetting:
			guard let cell = self.moreTableView.dequeueReusableCell(withIdentifier: ConstantsCellMore.standardCell) as? StandardTableViewCell else { return UITableViewCell() }
			cell.configure(cellViewModel: MoreCell.title(MoreCell.appsetting)())
			//			cell.delegate = self
			return cell
		case .account:
			guard let cell = self.moreTableView.dequeueReusableCell(withIdentifier: ConstantsCellMore.standardCell) as? StandardTableViewCell else { return UITableViewCell() }
			cell.configure(cellViewModel: MoreCell.title(MoreCell.account)())
		//	cell.delegate = self
			return cell
		case .help:
			guard let cell = self.moreTableView.dequeueReusableCell(withIdentifier: ConstantsCellMore.standardCell) as? StandardTableViewCell else { return UITableViewCell() }
			cell.configure(cellViewModel: MoreCell.title(MoreCell.help)())
	//		cell.delegate = self
			return cell
		case .signout:
			guard let cell = self.moreTableView.dequeueReusableCell(withIdentifier: ConstantsCellMore.standardCell) as? StandardTableViewCell else { return UITableViewCell() }
			cell.configure(cellViewModel: MoreCell.title(MoreCell.signout)())
//			cell.delegate = self
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

// MARK: - Enum
private enum ConstantsCellMore {
	static let profileCell = "ProfileTableViewCell"
	static let sharedCell = "SharedTableViewCell"
	static let myListCell = "MyListTableViewCell"
	static let standardCell = "StandardTableViewCell"
}

private enum MoreCell: String, CaseIterable {
	case detail, shared, mylist, appsetting, account, help, signout
}

private extension MoreCell {
	func title() -> String {
		switch self {
		case .detail:
			return "Detail"
		case .shared:
			return "Shared"
		case .mylist:
			return "Mylist"
		case .appsetting:
			return "Appsetting"
		case .account:
			return "Account"
		case .help:
			return "Help"
		case .signout:
			return "Signout"

		}
	}
}
