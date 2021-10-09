//
//  MovieResponse.swift
//  MovieApp
//
//  Created by MinhDev on 10/8/21.
//

import Foundation
import Model

struct MovieResponse: Codable {
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

	enum CodingKeys: String, CodingKey {
		case adult = "adult"
		case backdropPath = "backdrop_path"
		case genreIds = "genre_ids"
		case id = "id"
		case mediaType = "media_type"
		case originalLanguage = "original_language"
		case originalTitle = "original_title"
		case overview = "overview"
		case popularity = "popularity"
		case posterPath = "poster_path"
		case releaseDate = "release_date"
		case title = "title"
		case video = "video"
		case voteAverage = "vote_average"
		case voteCount = "vote_count"
	}
}
	extension MovieModel {
		init(movies: MovieResponse) {
			self.adult = movies.adult ?? false
			self.backdropPath = movies.backdropPath ?? ""
			self.genreIds = movies.genreIds ?? []
			self.id = movies.id ?? 0
			self.mediaType = movies.mediaType ?? ""
			self.originalLanguage = movies.originalLanguage ?? ""
			self.originalTitle = movies.originalTitle ?? ""
			self.overview = movies.overview ?? ""
			self.popularity = movies.popularity ?? 0
			self.posterPath = movies.posterPath ?? ""
			self.releaseDate = movies.releaseDate ?? ""
			self.title = movies.title ?? ""
			self.video = movies.video ?? true
			self.voteAverage = movies.voteAverage ?? 0
			self.voteCount = movies.voteCount ?? 0
		}
	}
