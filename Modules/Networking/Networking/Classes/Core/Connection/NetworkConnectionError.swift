//
//  NetworkConnectionError.swift
//  Networking
//
//  Created by NamNH on 30/09/2021.
//

import Foundation

protocol INetworkConnectionError: INetworkResponseError { }

enum NetworkConnectionError: INetworkConnectionError {
	case networkUnavailable
	case networkTimeOut
	
	init(_ error: NetworkErrorType) {
		switch error {
		case .networkError:
			self = .networkUnavailable
		case .timeOut:
			self = .networkTimeOut
		}
	}
	
	init(from decoder: Decoder) throws {
		throw NetworkConnectionError.networkTimeOut
	}
	
	var message: String? {
		switch self {
		case .networkUnavailable:
			return "Can't connect network!"
		case .networkTimeOut:
			return "Connect time out!"
		}
	}
	
	var name: String? {
		switch self {
		case .networkUnavailable:
			return "Error"
		case .networkTimeOut:
			return "Error"
		}
	}
}
