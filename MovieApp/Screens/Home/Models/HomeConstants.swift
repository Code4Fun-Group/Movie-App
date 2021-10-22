//
//  HomeConstance.swift
//  MovieApp
//
//  Created by MinhDev on 10/15/21.
//

import Foundation

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
	static let listItemCell = "ListItemCell"
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
