//
//  DetailViewModel.swift
//  MovieApp
//
//  Created by đông on 26/10/2021.
//

import Foundation

protocol IDetailViewModel {
	func getMovies()

}
class DetailViewModel {

	weak var viewController: IDetailViewController?
	var detailViewModels = [IMovieViewModel]()

	init(viewController: IDetailViewController) {
		self.viewController = viewController
	}
}

// MARK: - IDetailViewModel
//extension DetailViewModel: IDetailViewModel {
//	func getMovies() {
//		DependencyResolver.shared.movieAPIService.getMovies { [weak self] result in
//			guard let self = self else { return }
//			switch result {
//			case .success(let movies):
//				self.detailViewModels = movies.compactMap({
//					MovieViewModel(item: $0)
//
//				})
//				self.viewController?.showMovies()
//			case .failure(let error):
//				self.viewController?.showError(error.localizedDescription)
//			}
//		}
//	}
//}
