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

}

// MARK: - IDownloadViewModel
extension DownloadViewModel: IDownloadViewModel {
	func getMovies() {
	}
}
