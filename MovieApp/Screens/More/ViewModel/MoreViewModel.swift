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

}

// MARK: - IMoreViewModel
extension MoreViewModel: IMoreViewModel {
	func getMovies() {
	}
}
