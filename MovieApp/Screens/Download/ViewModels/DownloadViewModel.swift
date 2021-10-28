//
//  DownloadViewModel.swift
//  MovieApp
//
//  Created by MinhDev on 10/6/21.
//

import Foundation

protocol IDownloadViewModel {
	func getMovies()
}

class DownloadViewModel {
	weak var viewController: IDownloadViewController?
	var downloadMovieViewModels = [DownloadMovieViewModel]()
	init(viewController: IDownloadViewController) {
		self.viewController = viewController
	}
}

// MARK: - IDownloadViewModel
extension DownloadViewModel: IDownloadViewModel {
	func getMovies() {
		DependencyResolver.shared.movieAPIService.getMovies { [weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let movies):
				self.downloadMovieViewModels = movies.compactMap({
					DownloadMovieViewModel(item: $0)
				})
				self.viewController?.showMovies()
			case .failure:
				self.viewController?.showError()
			}
		}
	}
}
