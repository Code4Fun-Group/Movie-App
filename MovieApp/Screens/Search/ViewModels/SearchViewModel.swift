//
//  SearchViewModel.swift
//  MovieApp
//
//  Created by MinhDev on 10/6/21.
//

import UIKit
import Model

protocol ISearchMovieViewModel {
	var id: Int? { get }
	var title: String? { get }
	var imgUrl: String? { get }
}
struct SearchMovieViewModel {
	var id: Int?
	var title: String?
	var imgUrl: String?
}

// MARK: - ISearchViewModel
extension SearchMovieViewModel: ISearchMovieViewModel {
	init(item: IMovieModel) {
		id = item.id
		title = item.title
		imgUrl = item.posterPath
	}
}
