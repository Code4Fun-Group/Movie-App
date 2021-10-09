//
//  MovieViewModel.swift
//  MovieApp
//
//  Created by NamNH on 30/09/2021.
//

import UIKit
import Model

protocol IMovieViewModel {
	var id: Int { get }
	var title: String? { get }
	var imageURLStr: String? { get }
}

struct MovieViewModel {
	var id: Int
	var title: String?
	var imageURLStr: String?
	
}

extension MovieViewModel: IMovieViewModel {
	init(item: IMovieModel) {
		id = item.id ?? 0
		title = item.title
		//	imageURLStr = Constants.baseImageURL + item.posterPath
	}
}
