//
//  DetailsViewController.swift
//  MovieApp
//
//  Created by MinhDev on 10/6/21.
//

import UIKit

protocol IDetailViewController: AnyObject {
	func showMovies()
	func showError(_ errorMessage: String)
}

class DetailsViewController: BaseViewController {
	override func viewDidLoad() {
	super.viewDidLoad()
	}
}

