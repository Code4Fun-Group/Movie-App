//
//  MovieAppResourceQueryAdapter.swift
//  MovieApp
//
//  Created by NamNH on 30/09/2021.
//

import Networking
import Model

struct MovieAppResourceQueryAdapter {
	let config: INetworkingConfig

	init(config: INetworkingConfig) {
		self.config = config
	}
}

// MARK: - IMovieResourceQueryAdapter
extension MovieAppResourceQueryAdapter: IMovieResourceQueryAdapter {
	func getMovies() -> URLRequest {
		let url = config.endpoint.appendingPathComponent("movies")
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		return request
	}
	func getDownloadMovies() -> URLRequest {
		let url = config.endpoint.appendingPathComponent("movies/Download")
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		return request
}

	func getSearchMovies(searchText: String) -> URLRequest {
		let url = config.endpoint.appendingPathComponent("search?query=\(searchText)")
		var request = URLRequest(url: url)
		request.httpMethod = "GET"
		return request
	}

//	func getSearchMovies() -> URLRequest {
//		let url = config.endpoint.appendingPathComponent("search?query=Logan")
//		var request = URLRequest(url: url)
//		request.httpMethod = "GET"
//		return request
//	}
}
