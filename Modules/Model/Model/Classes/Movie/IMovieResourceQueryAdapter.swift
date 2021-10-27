//
//  IMovieResourceQueryAdapter.swift
//  Model
//
//  Created by NamNH on 30/09/2021.
//

import Foundation

public protocol IMovieResourceQueryAdapter {
	func getMovies() -> URLRequest
	func getSearchMovies(searchText: String) -> URLRequest
//	func getDetailMovies(id: Int) -> URLRequest
}
