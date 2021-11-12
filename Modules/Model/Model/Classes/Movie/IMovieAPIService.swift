//
//  IMovieAPIService.swift
//  Model
//
//  Created by NamNH on 30/09/2021.
//

import Foundation

public protocol IMovieAPIService {
	func getMovies(completion: @escaping (Result<[IMovieModel], Error>) -> Void)
	func getDownloadMovies(completion: @escaping (Result<[IMovieModel], Error>) -> Void)
	func getSearchMovies(searchText: String, completion: @escaping (Result<[IMovieModel], Error>) -> Void)
	func getDetailMovies(id: Int, completion: @escaping (Result<[IMovieModel], Error>) -> Void)
}
