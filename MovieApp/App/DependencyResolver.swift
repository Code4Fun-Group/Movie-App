//
//  DependencyResolver.swift
//  MovieApp
//
//  Created by NamNH on 30/09/2021.
//

import Model
import Networking

class DependencyResolver {
	// MARK: - Singleton
	static let shared = DependencyResolver()
	
	// MARK: - Variables
	let configuration = Configuration.default
	let movieAPIService: IMovieAPIService!
	
	// MARK: - Init
	private init() {
		movieAPIService = MovieAppAPIService(client: NetworkingService(),
											 query: MovieAppResourceQueryAdapter(config: configuration),
											 resourceHandler: MovieAppResourceResponseAdapter(jsonHandler: JSONDataHandler()))
	}
}
