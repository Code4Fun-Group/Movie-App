//
//  HomeViewController.swift
//  MovieApp
//
//  Created by NamNH on 21/09/2021.
//

import UIKit

private enum Constants {
	static let homeMovieCell = "HomeMovieCell"
	static let previewMovieCell = "PreviewCell"
	static let continueMovieCell = "ContinueCell"
	static let listMovieCell = "ListMovieCell"
	static let tvShowMovieCell = "TvShowViewCell"
	static let detailViewController = "DetailsViewController"
}

protocol IHomeViewController: AnyObject {
	func showMovies()
	func showError(_ errorMessage: String)
}

class HomeViewController: BaseViewController {
// MARK: - Outlets
	@IBOutlet private weak var tableView: UITableView!

// MARK: - Variables
	var coordinators: CoordinatorProtocol?
	private var viewModel: HomeViewModel?

// MARK: - Life cycles
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel = HomeViewModel(viewController: self)
		self.tableView.delegate = self
		self.tableView.dataSource = self
		setupUI()
		setupTableView()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		viewModel?.getListMovies()
	}
}

// MARK: - Private function
private extension HomeViewController {
	func setupUI() {
		self.tableView.backgroundColor = .clear
	}
	
	func setupTableView() {
		tableView.register(UINib(nibName: Constants.homeMovieCell, bundle: Bundle.main), forCellReuseIdentifier: Constants.homeMovieCell)
		tableView.register(UINib(nibName: Constants.previewMovieCell, bundle: Bundle.main), forCellReuseIdentifier: Constants.previewMovieCell)
		tableView.register(UINib(nibName: Constants.continueMovieCell, bundle: Bundle.main), forCellReuseIdentifier: Constants.continueMovieCell)
		tableView.register(UINib(nibName: Constants.listMovieCell, bundle: Bundle.main), forCellReuseIdentifier: Constants.listMovieCell)
		tableView.register(UINib(nibName: Constants.tvShowMovieCell, bundle: Bundle.main), forCellReuseIdentifier: Constants.tvShowMovieCell)
	}
}

// MARK: - IHomeViewController
extension HomeViewController: IHomeViewController {
	func showMovies() {
		tableView.reloadData()
	}
	
	func showError(_ errorMessage: String) {
		print(errorMessage)
	}
}

// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return viewModel?.sections.count ?? 0
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let tabCell = viewModel?.sections[indexPath.section]
		switch tabCell {
		case .home(let identifer, _):
			guard let cell = self.tableView.dequeueReusableCell(withIdentifier: identifer) as? HomeMovieCell else { return UITableViewCell() }
			cell.configure(with: viewModel?.movieViewModels.randomElement())
			return cell

		case .preview(let identifer, _):
			guard let cell = self.tableView.dequeueReusableCell(withIdentifier: identifer) as? PreviewCell else { return UITableViewCell() }
			cell.configure(preview: viewModel?.movieViewModels ?? [])
			cell.delegate = self
			return cell

		case .continueCell(let identifer, _):
			guard let cell = self.tableView.dequeueReusableCell(withIdentifier: identifer) as? ContinueCell else { return UITableViewCell() }
			cell.configure(with: viewModel?.movieViewModels ?? [])
			cell.delegate = self
			return cell

		case .list(let identifer, _):
			guard let cell = self.tableView.dequeueReusableCell(withIdentifier: identifer) as? ListMovieCell else { return UITableViewCell() }
			cell.configure(with: viewModel?.movieViewModels ?? [])
			cell.delegate = self
			return cell
		case .europe(let identifer, _):
			guard let cell = self.tableView.dequeueReusableCell(withIdentifier: identifer) as? ListMovieCell else { return UITableViewCell() }
			cell.configure(with: viewModel?.movieViewModels ?? [])
			cell.delegate = self
			return cell

		case .action(let identifer, _):
			guard let cell = self.tableView.dequeueReusableCell(withIdentifier: identifer) as? ListMovieCell else { return UITableViewCell() }
			cell.configure(with: viewModel?.movieViewModels ?? [])
			cell.delegate = self
			return cell
		case .romance(let identifer, _):
			guard let cell = self.tableView.dequeueReusableCell(withIdentifier: identifer) as? ListMovieCell else { return UITableViewCell() }
			cell.configure(with: viewModel?.movieViewModels ?? [])
			cell.delegate = self
			return cell
		case .tvShow(let identifer, _):
			guard let cell = self.tableView.dequeueReusableCell(withIdentifier: identifer) as? TvShowViewCell else { return UITableViewCell() }
			cell.configure(with: viewModel?.movieViewModels.randomElement())
//			cell.delegate = self
			return cell
		case .none:
			return UITableViewCell()
		}
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch indexPath.section {
		case 0:
			return 590.0
		case 1:
			return 135.0
		case 2 :
			return 220.0
		case 7:
			return 300.0
		default:
			return 200.0
		}
	}
	func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
		   if section == 0 {
			   return 0.0
		   } else {
			   return 40.0
		   }
	   }
	func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
		let tabCells = viewModel?.sections[section]
		switch tabCells {
		case .home( _, let title):
			return title
		case .preview( _, let title):
			return title
		case .continueCell( _, let title):
			return title
		case .list( _, let title):
			return title
		case .europe( _, let title):
			return title
		case .action( _, let title):
			return title
		case .romance( _, let title):
			return title
		case .tvShow( _, let title):
			return title
		default:
			return ""
		}
	}
}

// MARK: - UITableViewDelegate
extension HomeViewController: CellDelegate {
	func goDetailView(celldata: IMovieViewModel) {
		coordinators?.detailViewController()
		let change = DetailsViewController.fromStoryboard()
		self.navigationController?.pushViewController(change, animated: true)
	}
}

extension HomeViewController: UITableViewDelegate {
}
