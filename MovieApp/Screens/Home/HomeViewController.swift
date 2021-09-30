//
//  HomeViewController.swift
//  MovieApp
//
//  Created by NamNH on 21/09/2021.
//

import UIKit

private enum Constants {
	static let homeMovieCell = "HomeMovieCell"
}

protocol IHomeViewController: AnyObject {
	func showMovies()
	func showError(_ errorMessage: String)
}

class HomeViewController: UIViewController {
	// MARK: - Outlets
	@IBOutlet private weak var tableView: UITableView!
	
	// MARK: - Variables
	private var viewModel: HomeViewModel?
	
	// MARK: - Life cycles
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel = HomeViewModel(viewController: self)
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		viewModel?.getMovies()
	}
}

// MARK: - Private function
private extension HomeViewController {
	func setupUI() {
		
	}
	
	func setupTableView() {
		tableView.register(UINib(nibName: Constants.homeMovieCell, bundle: Bundle.main), forCellReuseIdentifier: Constants.homeMovieCell)
	}
}

// MARK: - IHomeViewController
extension HomeViewController: IHomeViewController {
	func showMovies() {
		tableView.reloadData()
	}
	
	func showError(_ errorMessage: String) {
		// TODO: - Show popup error
		
	}
}

extension HomeViewController: UITableViewDataSource {
	func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
		return viewModel?.movieViewModels.count ?? 0
	}
	
	func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
		guard let cell = tableView.dequeueReusableCell(withIdentifier: Constants.homeMovieCell) as? HomeMovieCell else { return UITableViewCell() }
		return cell
	}
}

extension HomeViewController: UITableViewDelegate {
	
}
