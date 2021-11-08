//
//  HomeViewModel.swift
//  MovieApp
//
//  Created by NamNH on 30/09/2021.
//

import UIKit
import Model

protocol IHomeViewModel {
	var sections: [CaseCell] { get }
	func getListMovies()
}
class HomeViewModel {
	weak var viewController: IHomeViewController?
	var movieViewModels = [MovieViewModel]()
	init(viewController: IHomeViewController) {
		self.viewController = viewController
	}
}

// MARK: - IHomeViewModel
extension HomeViewModel: IHomeViewModel {
	var sections: [CaseCell] {
		return [
			.home(identifer: "HomeMovieCell", title: "HOME"),
			.preview(identifer: "PreviewCell", title : "PREVIEW"),
			.continueCell(identifer: "ContinueCell", title: "CONTINUE"),
			.list(identifer: "ListMovieCell", title: "MY LIST"),
			.europe(identifer: "ListMovieCell", title: "EUROPE"),
			.action(identifer: "ListMovieCell", title: "ACTION"),
			.romance(identifer: "ListMovieCell", title: "ROMANCE"),
			.tvShow(identifer: "TvShowViewCell", title: "TV SHOW")
		]
	}

	func getListMovies() {
		DependencyResolver.shared.movieAPIService.getMovies { [weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let movies):
				self.movieViewModels = movies.compactMap({
					MovieViewModel(item: $0)
				})
				self.viewController?.showMovies()
			case .failure(let error):
				self.viewController?.showError(error.localizedDescription)
			}
		}
	}
}
