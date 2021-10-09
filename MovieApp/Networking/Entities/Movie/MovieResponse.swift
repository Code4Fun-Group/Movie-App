//
//  MovieResponse.swift
//  MovieApp
//
//  Created by NamNH on 30/09/2021.
//

import Model

struct MovieResponse: Codable {
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
	init(item: MovieResponse) {
		
	}
}
