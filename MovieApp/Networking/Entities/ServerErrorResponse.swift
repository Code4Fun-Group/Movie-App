//
//  ServerErrorResponse.swift
//  MovieApp
//
//  Created by NamNH on 30/09/2021.
//

import UIKit

struct ServerErrorResponse: Codable {
	let status: Int?
	let name: String?
	let message: String?
}
