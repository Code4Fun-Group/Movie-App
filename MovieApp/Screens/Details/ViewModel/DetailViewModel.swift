//
//  DetailViewModel.swift
//  MovieApp
//
//  Created by đông on 11/11/2021.
//

import Foundation
import Model

protocol IDetailMovieViewModel {
	var id: Int? { get }
	var title: String? { get }
	var imgUrl: String? { get }
}
struct DetailMovieViewModel {
	var id: Int?
	var title: String?
	var imgUrl: String?
}

// MARK: - ISearchViewModel
extension DetailMovieViewModel: IDetailMovieViewModel {
	init(item: IMovieModel) {
		id = item.id
		title = item.title
		imgUrl = item.posterPath
	}
}
