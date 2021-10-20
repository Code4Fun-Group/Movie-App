//
//  MoreViewModel.swift
//  MovieApp
//
//  Created by MinhDev on 10/6/21.
//

import Foundation

protocol IMoreViewModel {
	func getMovies()
}

class MoreViewModel {
	weak var viewController: IMoreViewController?
	var movieViewModels = [MovieViewModel]()
	init(viewController: IMoreViewController) {
		self.viewController = viewController
	}
}
// MARK: - IMoreViewModel
extension MoreViewModel: IMoreViewModel {
	func getMovies() {
	}
}
