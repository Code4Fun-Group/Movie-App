//
//  Configuration.swift
//  MovieApp
//
//  Created by MinhDev on 10/8/21.
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
		return URL(string: "https://code4fun.group")!
	}
}
