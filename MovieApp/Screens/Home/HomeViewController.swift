//
//  HomeViewController.swift
//  MovieApp
//
//  Created by NamNH on 21/09/2021.
//

import UIKit

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
		self.tableView.backgroundColor = .black
	}
	
	func setupTableView() {
		tableView.register(UINib(nibName: Constants.bannerViewCell, bundle: Bundle.main), forCellReuseIdentifier: Constants.bannerViewCell)
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
		// TODO: - Show popup error
		print(errorMessage)
	}
}
	// MARK: - UITableViewDataSource
extension HomeViewController: UITableViewDataSource {
	func numberOfSections(in tableView: UITableView) -> Int {
		return CaseCell.allCases.count
	}

	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return 1
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		let tabCell = CaseCell.allCases[indexPath.section]
		switch tabCell {
		case .home:
			guard let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.bannerViewCell) as? BannerViewCell else { return UITableViewCell() }
			cell.configure(cellViewModel: viewModel?.movieViewModels.last)
			return cell
		case .preview:
			guard let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.previewMovieCell) as? PreviewCell else { return UITableViewCell() }
			cell.configure(preview: viewModel?.movieViewModels ?? [])
			return cell
		case .continueCell:
			guard let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.continueMovieCell) as? ContinueCell else { return UITableViewCell() }
			cell.configure(with: viewModel?.movieViewModels ?? [])
			return cell
		case .list:
			guard let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.listMovieCell) as? ListMovieCell else { return UITableViewCell() }
			cell.configure(with: viewModel?.movieViewModels ?? [])
			return cell
		default:
			guard let cell = self.tableView.dequeueReusableCell(withIdentifier: Constants.listMovieCell) as? ListMovieCell else { return UITableViewCell() }
			cell.configure(with: viewModel?.movieViewModels ?? [])
			return cell
		}
	}

	func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
		switch indexPath.section {
		case 0:
			return 590.0
		case 1:
			return 150.0
		case 2 :
			return 220.0
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

	 func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
		if section == 0 {
			let view = UIView()
			return view
		} else {
			let headerView = UIView.init(frame: CGRect.init(x: 0, y: 0, width: tableView.frame.width, height: 40.0))
			headerView.backgroundColor = .black
			let label = UILabel()
			label.frame = CGRect.init(x: 10, y: 0, width: headerView.frame.width - 10, height: headerView.frame.height)
			label.font = UIFont(name: "HelveticaNeue-Bold", size: 35.0)
			label.textColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
			headerView.addSubview(label)
			headerView.clearsContextBeforeDrawing = true
			var header = [String]()
			for item in CaseCell.allCases {
				header.append(item.title())
			}
			label.text = header[section]
			return headerView
		}
	}
}
	// MARK: - UITableViewDelegate
extension HomeViewController: clickedCell {
	func goDetailView(celldata: MovieViewModel) {
		coordinators?.detailViewController()
		let change = DetailsViewController.fromStoryboard()
//		let storyboard = UIStoryboard(name: "Main", bundle: nil)
//		guard let change = storyboard.instantiateViewController(withIdentifier: Constants.detailViewController) as? DetailsViewController else { return }
		self.navigationController?.pushViewController(change, animated: true)
	}
}
extension HomeViewController: UITableViewDelegate {
}
