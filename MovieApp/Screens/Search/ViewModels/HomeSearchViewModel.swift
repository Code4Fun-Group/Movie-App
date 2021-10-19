//
//  HomeSearchViewModel.swift
//  MovieApp
//
//  Created by đông on 07/10/2021.
//

import Foundation

protocol ISearchViewModel {
	func getMovies()
}

class HomeSearchViewModel {
	weak var searchViewController: ISearchViewController?
	var searchMovieViewModels = [SearchMovieViewModel]()
	init(searchViewController: ISearchViewController) {
		self.searchViewController = searchViewController
	}
}

// MARK: - IHomeSearchViewModel
extension HomeSearchViewModel: ISearchViewModel {
	func getMovies() {

		DependencyResolver.shared.movieAPIService.getMovies { [weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let movies):
				self.searchMovieViewModels = movies.compactMap({
					SearchMovieViewModel(item: $0)
				})
				self.searchViewController?.showMovies()
			case .failure(let error):
				self.searchViewController?.showError(error.localizedDescription)
			}
		}
	}

	func getSearchMovies() {
		var data: String?
		DependencyResolver.shared.movieAPIService.getMovies { [weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let movies):
				self.searchMovieViewModels = movies.compactMap({
					SearchMovieViewModel(item: $0.title?.uppercased().contains(data?.uppercased() ?? "") as! IMovieModel)
				})
				self.searchViewController?.showMovies()
			case .failure(let error):
				self.searchViewController?.showError(error.localizedDescription)
			}
		}
	}

	func searchCount(_ searchActive: Bool, _ searchTemp: [ SearchMovieViewModel], _ searchData: [SearchMovieViewModel]) -> Int {
		if searchActive == false {
			return searchTemp.count
		} else {
			return searchData.count
		}
	}

//	func search(_ searchText: String, _ searchActive1: Bool, _ searchTemp: [ SearchMovieViewModel],
//				_ filter: [SearchMovieViewModel]) -> () {
//		if searchText.isEmpty == false {
//			
//		}
//	}
}
