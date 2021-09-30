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
}
