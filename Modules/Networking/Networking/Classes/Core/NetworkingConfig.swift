//
//  NetworkingConfig.swift
//  Networking
//
//  Created by NamNH on 30/09/2021.
//

import Foundation

public protocol INetworkingConfig {
	var apiKey: String { get }
	var endpoint: URL { get }
}
