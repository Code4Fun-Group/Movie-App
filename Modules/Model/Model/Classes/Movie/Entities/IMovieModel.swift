//
//  IMovieModel.swift
//  Model
//
//  Created by NamNH on 30/09/2021.
//

import Foundation

public protocol IMovieModel {
	var adult: Bool? { get }
	var backdropPath: String? { get }
	var genreIds: [Int]? { get }
	var id: Int? { get }
	var mediaType: String? { get }
	var originalLanguage: String? { get }
	var originalTitle: String? { get }
	var overview: String? { get }
	var popularity: Int? { get }
	var posterPath: String? { get }
	var releaseDate: String? { get }
	var title: String? { get }
	var video: Bool? { get }
	var voteAverage: Double? { get }
	var voteCount: Int? { get }
}
