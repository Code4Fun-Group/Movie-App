//
//  DetailsViewController.swift
//  MovieApp
//
//  Created by MinhDev on 10/6/21.
//

import UIKit

class DetailsViewController: BaseViewController {
	// MARK: - Life cycles
	override func viewDidLoad() {
	super.viewDidLoad()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.isNavigationBarHidden = false
		self.tabBarController?.tabBar.isHidden = true
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.navigationController?.isNavigationBarHidden = true
		self.tabBarController?.tabBar.isHidden = false
	}
}
