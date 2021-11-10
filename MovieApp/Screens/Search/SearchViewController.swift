//
//  SearchViewController.swift
//  MovieApp
//
//  Created by MinhDev on 10/6/21.
//

import UIKit

private enum ConstantSearch {
	static let searchCLVC = "SearchCollectionViewCell"
	static let searchCollectionReusableView = "SearchCollectionReusableView"
	static let searchDetailCell = "SearchDetailCell"
	static let detailVC = "DetailsViewController"
	static let heightCLVC = 6.0
	static let heightHeaderCLVC = 10.0
}

protocol ISearchViewController: AnyObject {
	func showMovies()
	func showError(_ errorMessage: String)
}

class SearchViewController: BaseViewController {
	// MARK: - IBOutlets
	@IBOutlet weak var searchCollectionView: UICollectionView!

	// MARK: - Variables
	var coordinators: CoordinatorProtocol?
	private var data = String()
	private var searchViewModel: HomeSearchViewModel?
	var searchController = UISearchController()
	var searchActive = false
	var isSimpleLayoutSearch = false

	// MARK: - Life cycles
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		setupSearchUI()
		searchViewModel = HomeSearchViewModel(searchViewController: self)
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		searchViewModel?.getMovies()
		self.navigationController?.isNavigationBarHidden = false
	}
}

// MARK: - Private function
private extension SearchViewController {
	func setupUI() {
		// MARK: - CollectionView
		searchCollectionView.delegate = self
		searchCollectionView.dataSource = self
		searchCollectionView.register(UINib(nibName: ConstantSearch.searchCLVC, bundle: Bundle.main), forCellWithReuseIdentifier: ConstantSearch.searchCLVC)
		searchCollectionView.register(UINib(nibName: ConstantSearch.searchDetailCell, bundle: Bundle.main), forCellWithReuseIdentifier: ConstantSearch.searchDetailCell)
		searchCollectionView.register(UINib(nibName: ConstantSearch.searchCollectionReusableView, bundle: Bundle.main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ConstantSearch.searchCollectionReusableView)
	}

	func setupSearchUI() {
		// MARK: - SearchBar
		searchController.searchBar.delegate = self
		searchController.searchResultsUpdater = self
		searchController.obscuresBackgroundDuringPresentation = false
		searchController.searchBar.enablesReturnKeyAutomatically = false
		navigationItem.searchController = searchController
		navigationItem.hidesSearchBarWhenScrolling = false
	}
}

// MARK: - IHomeViewController
extension SearchViewController: ISearchViewController {
	func showMovies() {
		searchCollectionView.reloadData()
	}

	func showError(_ errorMessage: String) {
		// TODO: - Show popup error
		print(errorMessage)
	}
}

// MARK: - UICollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return searchViewModel?.searchMovieViewModels.count ?? 0
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
			guard let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: ConstantSearch.searchCLVC, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
			cell.configured(movieData: searchViewModel?.searchMovieViewModels[indexPath.row] )
			return cell

	}

	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: ConstantSearch.searchCollectionReusableView, for: indexPath) as! SearchCollectionReusableView
		headerView.configure()
		return headerView
	}
}

extension SearchViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / CGFloat(ConstantSearch.heightCLVC))
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: view.frame.size.width, height: view.frame.size.width / CGFloat(ConstantSearch.heightHeaderCLVC))
	}
}

// MARK: - UICollectionViewDelegate
extension SearchViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		coordinators?.detailViewController()
		let change = DetailsViewController.fromStoryboard()
		navigationController?.pushViewController(change, animated: true)
	}
}

// MARK: - UISearchResultsUpdating
extension SearchViewController: UISearchResultsUpdating {
	func updateSearchResults(for searchController: UISearchController) {
		requestForText(searchController.searchBar.text ?? "")
	}

	private func requestForText(_ term: String?) {
		guard let text = term, !text.isEmpty else {
			return
		}
		self.data = text
	}
}

extension SearchViewController: UISearchBarDelegate {
	func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
		var pendingRequestWorkItem: DispatchWorkItem?
		if searchText.isEmpty == false {
			searchActive = true
			pendingRequestWorkItem?.cancel()
			let requestWorkItem = DispatchWorkItem { [weak self] in
				self?.searchViewModel?.getSearchMovies(searchText: searchText)
			}
			pendingRequestWorkItem = requestWorkItem
			DispatchQueue.main.asyncAfter(deadline: .now() + .milliseconds(1300), execute: requestWorkItem)
		} else {
			searchActive = false
		}
		searchCollectionView.reloadData()
	}

	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		searchCollectionView.reloadData()
	}
}
