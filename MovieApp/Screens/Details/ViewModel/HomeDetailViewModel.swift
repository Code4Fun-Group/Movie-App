//
//  HomeDetailViewModel.swift
//  MovieApp
//
//  Created by đông on 11/11/2021.
//

import Foundation
import Model

protocol IDetailViewModel {
//	func getMovies()
	func getDetailMovies(id: Int)
}

class HomeDetailViewModel {
	weak var detailViewController: IDetailViewController?
	var detailMovieViewModels = [DetailMovieViewModel]()
	init(detailViewController: IDetailViewController) {
		self.detailViewController = detailViewController
	}
}

// MARK: - IHomeSearchViewModel
extension HomeDetailViewModel: IDetailViewModel {
//	func getMovies() {
//		<#code#>
//	}

	func getDetailMovies(id: Int) {
		DependencyResolver.shared.movieAPIService.getDetailMovies(id: 284053) { [weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let movies):
				self.detailMovieViewModels.removeAll()
				self.detailMovieViewModels = movies.compactMap({
					DetailMovieViewModel(item: $0)
				})
				print(movies)
				self.detailViewController?.showMovies()
			case .failure(let error):
				self.detailViewController?.showError(error.localizedDescription)
			}
		}
	}
}
