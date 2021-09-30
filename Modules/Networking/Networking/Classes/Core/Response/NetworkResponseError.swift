//
//  NetworkResponseError.swift
//  Networking
//
//  Created by NamNH on 30/09/2021.
//

import Foundation

public protocol INetworkResponseError: Error {
	var message: String? { get }
	var name: String? { get }
}

public struct NetworkResponseError: INetworkResponseError {
	public let message: String?
	public let name: String?
	public let status: Int?
	
	public init(message: String?, name: String?, status: Int?) {
		self.message = message
		self.name = name
		self.status = status
	}
}

public extension Error {
	var responseData: Data? {
		if let nsError = self as NSError? {
			let responseData = nsError.userInfo["responseData"] as? Data
			return responseData
		} else {
			return nil
		}
	}
}
