//
//  NetworkErrorResponseHandler.swift
//  Networking
//
//  Created by NamNH on 30/09/2021.
//

import Foundation

public protocol INetworkErrorResponseHandler {
	func handle(errorData: Data?, completion: @escaping (INetworkResponseError?) -> Void)
}
