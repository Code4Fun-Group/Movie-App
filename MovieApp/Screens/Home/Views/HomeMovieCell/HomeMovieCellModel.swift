//
//  HomeMovieCellModel.swift
//  MovieApp
//
//  Created by MinhDev on 10/4/21.
//

import Foundation
import Model

struct HomeMovieCellViewModel {
    var adult: Bool
    var backdropPath: String
    var genreIds: [Int]
    var id: Int
    var mediaType: String
    var originalLanguage: String
    var originalTitle: String
    var overview: String
    var popularity: Int
    var posterPath: String
    var releaseDate: String
    var title: String
    var video: Bool
    var voteAverage: Double
    var voteCount: Int

    init(_ movie: IMovieModel) {
        self.adult = movie.adult
        self.backdropPath = movie.backdropPath
        self.genreIds = movie.genreIds
        self.id = movie.id
        self.mediaType = movie.mediaType
        self.originalLanguage = movie.originalLanguage
        self.originalTitle = movie.originalTitle
        self.overview = movie.overview
        self.popularity = movie.popularity
        self.posterPath = movie.posterPath
        self.releaseDate = movie.releaseDate
        self.title = movie.title
        self.video = movie.video
        self.voteAverage = movie.voteAverage
        self.voteCount = movie.voteCount
    }
}
