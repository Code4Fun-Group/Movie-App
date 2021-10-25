//
//  MoreFileViewModel.swift
//  MovieApp
//
//  Created by MinhDev on 10/21/21.
//

import Model

protocol IMoreMovieViewModel {
	var backdropPath: String? { get }
	var genreIds: [Int]? { get }
	var id: Int? { get }
	var mediaType: String? { get }
	var posterPath: String? { get }
	var releaseDate: String? { get }
	var title: String? { get }
	var voteAverage: Double? { get }
}

struct MoreMovieViewModel {
	var backdropPath: String?
	var genreIds: [Int]?
	var id: Int?
	var mediaType: String?
	var posterPath: String?
	var releaseDate: String?
	var title: String?
	var voteAverage: Double?
}

extension MoreMovieViewModel: IMoreMovieViewModel {
	init(item: IMovieModel) {
		backdropPath = item.backdropPath
		genreIds = item.genreIds
		id = item.id
		mediaType = item.mediaType
		posterPath = item.posterPath
		releaseDate = item.releaseDate
		title = item.title
		voteAverage = item.voteAverage
	}
}
