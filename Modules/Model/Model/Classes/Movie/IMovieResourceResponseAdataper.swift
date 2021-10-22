//
//  IMovieResourceResponseAdataper.swift
//  Model
//
//  Created by NamNH on 30/09/2021.
//

import Foundation

public protocol IMovieResourceResponseAdataper {
	func getMovies(_ data: Data?, completion: @escaping (Result<[IMovieModel], Error>) -> Void)
	func getSearchMovies(_ data: Data?, completion: @escaping (Result<[IMovieModel], Error>) -> Void)
}
