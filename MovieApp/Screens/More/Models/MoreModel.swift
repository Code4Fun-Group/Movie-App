//
//  MoreModel.swift
//  MovieApp
//
//  Created by MinhDev on 10/21/21.
//

import Model

struct MoreModel: IMovieModel {
	let adult: Bool?
	let backdropPath: String?
	let genreIds: [Int]?
	let id: Int?
	let mediaType: String?
	let originalLanguage: String?
	let originalTitle: String?
	let overview: String?
	let popularity: Int?
	let posterPath: String?
	let releaseDate: String?
	let title: String?
	let video: Bool?
	let voteAverage: Double?
	let voteCount: Int?
}
