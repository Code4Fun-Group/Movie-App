//
//  MoreViewController.swift
//  MovieApp
//
//  Created by MinhDev on 10/6/21.
//

import UIKit

protocol IMoreViewController: AnyObject {
	func showMovies()
	func showError(_ errorMessage: String)
}

class MoreViewController: BaseViewController {
	// MARK: - Life cycles
	override func viewDidLoad() {
		super.viewDidLoad()
	}
}
