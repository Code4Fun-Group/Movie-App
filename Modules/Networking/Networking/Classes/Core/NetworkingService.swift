//
//  NetworkingService.swift
//  Networking
//
//  Created by NamNH on 30/09/2021.
//

import Foundation
import Alamofire

public protocol INetworkingService {
	func request(_ request: URLRequest, completion: @escaping (Result<Data?, Error>) -> Void)
}

public protocol INetworkingServiceDataHandler {
	func handle(jsonData: Data?, completion: (Result<Data, Error>) -> Void)
}

public struct NetworkingService {
	
	let networkConnectionHandler: INetworkConnectionHandler!
	
	public init() {
		networkConnectionHandler = NetworkConnectionHandler()
	}
}

extension NetworkingService: INetworkingService {
	public func request(_ request: URLRequest, completion: @escaping (Result<Data?, Error>) -> Void) {
		networkConnectionHandler.waitUntilCheckNetworkConnectionCompleted { result in
			switch result {
			case .success:
				AF.request(request).responseData { response in
					switch response.result {
					case .success(let data):
						completion(.success(data))
					case .failure(let error):
						completion(.failure(error))
					}
				}
			case .failure(let error):
				completion(.failure(error))
			}
		}
	}
}
