//
//  MovieAppAPIService.swift
//  MovieApp
//
//  Created by NamNH on 30/09/2021.
//

import Networking
import Model

class MovieAppAPIService {
	// MARK: - Variables
	public let client: INetworkingService
	public let query: MovieAppResourceQueryAdapter
	public let resourceHandler: MovieAppResourceResponseAdapter
	
	// MARK: - Init
	public init(client: INetworkingService,
				query: MovieAppResourceQueryAdapter,
				resourceHandler: MovieAppResourceResponseAdapter) {
		self.client = client
		self.query = query
		self.resourceHandler = resourceHandler
	}
}

// MARK: - IMovieAPIService
extension MovieAppAPIService: IMovieAPIService {

	func getMovies(completion: @escaping (Result<[IMovieModel], Error>) -> Void) {
		let request = query.getMovies()
		client.request(request) { [weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let data):
 				self.resourceHandler.getMovies(data, completion: completion)
			case .failure(let error):
				guard let errorData = error.responseData else {
					completion(.failure(error))
					return
				}
				self.resourceHandler.handle(errorData: errorData) { serverError in
					completion(.failure(serverError ?? error))
				}
			}
		}
	}

	func getSearchMovies(searchText: String, completion: @escaping (Result<[IMovieModel], Error>) -> Void) {
		let request = query.getSearchMovies(searchText: searchText)
		client.request(request) { [weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let data):
				self.resourceHandler.getSearchMovies(data, completion: completion)
			case .failure(let error):
				guard let errorData = error.responseData else {
					completion(.failure(error))
					return
				}
				self.resourceHandler.handle(errorData: errorData) { serverError in
					completion(.failure(serverError ?? error))
				}
			}
		}
	}

	func getDetailMovies(id: Int, completion: @escaping (Result<[IMovieModel], Error>) -> Void) {
		let request = query.getSearchMovies(searchText: searchText)
		client.request(request) { [weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let data):
				self.resourceHandler.getSearchMovies(data, completion: completion)
			case .failure(let error):
				guard let errorData = error.responseData else {
					completion(.failure(error))
					return
				}
				self.resourceHandler.handle(errorData: errorData) { serverError in
					completion(.failure(serverError ?? error))
				}
			}
		}
	}
}
