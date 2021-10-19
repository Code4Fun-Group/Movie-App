//
//  SearchViewController.swift
//  MovieApp
//
//  Created by MinhDev on 10/6/21.
//

import UIKit

private enum Constants {
	static let searchCLVC = "SearchCollectionViewCell"
	static let searchCollectionReusableView = "SearchCollectionReusableView"
	static let searchDetailCell = "SearchDetailCell"
}

protocol ISearchViewController: AnyObject {
	func showMovies()
	func showError(_ errorMessage: String)
}

class SearchViewController: BaseViewController {
	// MARK: - IBOutlets
	@IBOutlet weak var searchCollectionView: UICollectionView!

	// MARK: - Variables
	private var data = String()
	private var searchViewModel: HomeSearchViewModel?
	var searchController = UISearchController()
	var searchActive = false
	var isSimpleLayoutSearch = false
	var filter: [SearchMovieViewModel] = [SearchMovieViewModel]()

	// MARK: - Life cycles
	override func viewDidLoad() {
		super.viewDidLoad()
		setupUI()
		searchViewModel = HomeSearchViewModel(searchViewController: self)
	}

	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		searchViewModel?.getMovies()
	}
}

// MARK: - Private function
private extension SearchViewController {
	func setupUI() {

		// MARK: - CollectionView
		searchCollectionView.delegate = self
		searchCollectionView.dataSource = self
		searchCollectionView.register(UINib(nibName: Constants.searchCLVC, bundle: Bundle.main), forCellWithReuseIdentifier: Constants.searchCLVC)
		searchCollectionView.register(UINib(nibName: Constants.searchDetailCell, bundle: Bundle.main), forCellWithReuseIdentifier: Constants.searchDetailCell)
		searchCollectionView.register(UINib(nibName: Constants.searchCollectionReusableView, bundle: Bundle.main), forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.searchCollectionReusableView)
		
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

// MARK: UICollectionViewDataSource
extension SearchViewController: UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return searchViewModel?.searchCount(searchActive, searchViewModel?.searchMovieViewModels ?? [], filter) ?? 0
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		if searchActive {
			guard let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.searchDetailCell, for: indexPath) as? SearchDetailCell else { return UICollectionViewCell() }
			cell.configured(movieData: filter[indexPath.row])
			return cell
		} else {
			guard let cell = searchCollectionView.dequeueReusableCell(withReuseIdentifier: Constants.searchCLVC, for: indexPath) as? SearchCollectionViewCell else { return UICollectionViewCell() }
			cell.configured(movieData: searchViewModel?.searchMovieViewModels[indexPath.row] )
			return cell
		}
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width, height: collectionView.frame.height / 6)
	}

	func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
		let headerView = collectionView.dequeueReusableSupplementaryView(ofKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: Constants.searchCollectionReusableView, for: indexPath) as! SearchCollectionReusableView
		headerView.configure()
		return headerView
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
		return CGSize(width: view.frame.size.width, height: view.frame.size.width / 10)
	}
}

// MARK: UICollectionViewDelegate
extension SearchViewController: UICollectionViewDelegate {

}

// MARK: UISearchResultsUpdating
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
		if searchText.isEmpty == false {
			searchActive = true
			filter.removeAll()
			for item in searchViewModel?.searchMovieViewModels ?? [] {
				if item.title?.uppercased().contains(data.uppercased()) == true {
					filter = searchViewModel?.searchMovieViewModels.filter { ($0.title ?? "").contains(searchText) } ?? []
				}
			}
		} else {
			searchActive = false
			filter.removeAll()
		}
		searchCollectionView.reloadData()
	}

//	searchViewModel?.search(<#T##String#>, <#T##Bool#>, <#T##[SearchMovieViewModel]#>, <#T##[SearchMovieViewModel]#>)
	func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
		filter.removeAll()
		searchCollectionView.reloadData()
	}
}
