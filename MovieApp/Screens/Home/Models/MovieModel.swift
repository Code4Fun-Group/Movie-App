//
//  MovieModel.swift
//  MovieApp
//
//  Created by NamNH on 30/09/2021.
//

import Model

struct MovieModel: IMovieModel {
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
