//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by NamNH on 30/09/2021.
//

import UIKit
import Model

protocol IMovieViewModel {
	var backdropPath: String? { get }
	var genreIds: [Int]? { get }
	var id: Int? { get }
	var mediaType: String? { get }
	var posterPath: String? { get }
	var releaseDate: String? { get }
	var title: String? { get }
	var voteAverage: Double? { get }
	var voteCount: Int? { get }
}

struct MovieViewModel {
	var backdropPath: String?
	var genreIds: [Int]?
	var id: Int?
	var mediaType: String?
	var posterPath: String?
	var releaseDate: String?
	var title: String?
	var voteAverage: Double?
	var voteCount: Int?
}

extension MovieViewModel: IMovieViewModel {
	init(item: IMovieModel) {
		backdropPath = item.backdropPath
		genreIds = item.genreIds
		id = item.id
		mediaType = item.mediaType
		posterPath = item.posterPath
		releaseDate = item.releaseDate
		title = item.title
		voteAverage = item.voteAverage
		voteCount = item.voteCount
	}
}
