//
//  SearchModel.swift
//  MovieApp
//
//  Created by đông on 05/10/2021.
//

import Foundation
import Model

struct SearchModel: IMovieModel {
	var adult: Bool?
	var backdropPath: String?
	var genreIds: [Int]?
	var id: Int?
	var mediaType: String?
	var originalLanguage: String?
	var originalTitle: String?
	var overview: String?
	var popularity: Int?
	var posterPath: String?
	var releaseDate: String?
	var title: String?
	var video: Bool?
	var voteAverage: Double?
	var voteCount: Int?
}
