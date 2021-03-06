//
//  MovieAppResourceResponseAdapter.swift
//  MovieApp
//
//  Created by NamNH on 30/09/2021.
//

import Networking
import Model

struct MovieAppResourceResponseAdapter {
	let jsonHandler: JSONDataHandler
}

extension MovieAppResourceResponseAdapter: INetworkErrorResponseHandler {
	func handle(errorData: Data?, completion: @escaping (INetworkResponseError?) -> Void) {
		jsonHandler.handle(jsonData: errorData) { (response: Result<ServerErrorResponse, Error>) in
			switch response {
			case .success(let serverError):
				let error = NetworkResponseError(message: serverError.message,
												 name: serverError.name,
												 status: serverError.status)
				completion(error)
			case .failure:
				let error = NetworkResponseError(message: "Unknown",
												 name: "Unknown",
												 status: nil)
				completion(error)
			}
		}
	}
}
// MARK: - IMovieResourceResponseAdataper
extension MovieAppResourceResponseAdapter: IMovieResourceResponseAdataper {
	func getMovies(_ data: Data?, completion: @escaping (Result<[IMovieModel], Error>) -> Void) {
		jsonHandler.handle(jsonData: data) { (response: Result<[MovieResponse], Error>) in
			switch response {
			case .success(let resources):
				let movies = resources.compactMap({
					MovieModel(item: $0)
				})
				completion(.success(movies))
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}
}
