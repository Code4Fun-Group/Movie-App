//
//  GlobalConstants.swift
//  MovieApp
//
//  Created by NamNH on 29/09/2021.
//

import Foundation

enum GlobalConstants {
	static let homeMovies = "Home"
	static let searchMovies = "Search"
	static let comingMovies = "ComingSoon"
	static let detailsMovies = "Movie"
	static let downloadMovies = "DownLoad"
	static let more = "More"

}

enum Constants {
	static let homeMovieCell = "HomeMovieCell"
	static let previewMovieCell = "PreviewCell"
	static let continueMovieCell = "ContinueCell"
	static let listMovieCell = "ListMovieCell"
	static let tvShowMovieCell = "TvShowViewCell"
	static let detailViewController = "DetailsViewController"
}

enum ConstantsCell {
	static let previewCollectionCell = "PreviewCollectionViewCell"
	static let continueItemCell = "ContinueItemCell"
	static let listItemCellCV = "ListItemCellCV"
}

enum Icon {
	static let home = "Home"
	static let search = "Search Icon"
	static let coming = "Comingsoon"
	static let download = "DownLoad"
	static let more = "More"
}

enum Config {
	static let imageUrl = "https://image.tmdb.org/t/p/w500"
}
enum CaseCell: String, CaseIterable {
	case home, preview, continueCell, list, europe, romance, action
}
extension CaseCell {
	func title() -> String {
		switch self {
		case .home:
			return "Home"
		case .preview:
			return "Preview"
		case .continueCell:
			return "Continue"
		case .list:
			return "List"
		case .europe:
			return "Europe"
		case .romance:
			return "Romance"
		case .action:
			return "Action"

		}
	}
}
