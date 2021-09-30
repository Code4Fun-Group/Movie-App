//
//  NetworkConnectionHandler.swift
//  Networking
//
//  Created by NamNH on 30/09/2021.
//

import UIKit

public protocol INetworkConnectionHandler {
	func waitUntilCheckNetworkConnectionCompleted(completion: @escaping (Result<Bool, Error>) -> Void)
}

class NetworkConnectionHandler: INetworkConnectionHandler {
	func waitUntilCheckNetworkConnectionCompleted(completion: @escaping (Result<Bool, Error>) -> Void) {
		isNetworkAvailable() ? completion(.success(true)): completion(.failure(NetworkConnectionError(NetworkErrorType.networkError)))
	}
}

// MARK: - Private
private extension NetworkConnectionHandler {
	func isNetworkAvailable() -> Bool {
		let reachability = try? Reachability()
		
		switch reachability?.connection {
		case .cellular, .wifi:
			return true
		case .unavailable:
			return false
		case .none?:
			return false
		case nil:
			return false
		}
	}
}
