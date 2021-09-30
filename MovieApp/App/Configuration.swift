//
//  Configuration.swift
//  MovieApp
//
//  Created by NamNH on 30/09/2021.
//

import UIKit
import Networking

// swiftlint:disable force_unwrapping
enum Configuration: INetworkingConfig {
	case `default`
	
	var apiKey: String {
		return ""
	}
	
	var endpoint: URL {
		return URL(string: "http://localhost")!
	}
}
