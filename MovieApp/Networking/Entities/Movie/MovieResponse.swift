//
//  MovieResponse.swift
//  MovieApp
//
//  Created by NamNH on 30/09/2021.
//

import Model

// swiftlint:disable identifier_name
struct MovieResponse: Codable {
	var adult: Bool?
	var backdrop_path: String?
	var genre_ids: [Int]?
	var id: Int?
	var media_type: String?
	var original_language: String?
	var original_title: String?
	var overview: String?
	var popularity: Int?
	var poster_path: String?
	var release_date: String?
	var title: String?
	var video: Bool?
	var vote_average: Double?
	var vote_count: Int?
}

extension MovieModel {
	init(item: MovieResponse) {
		
	}
}
