//
//  DownloadCoodinator.swift
//  MovieApp
//
//  Created by MinhDev on 10/8/21.
//

import Foundation
import UIKit

class DownloadCoordinator: CoordinatorProtocol {
// MARK: - Variables
	var navigationController: UINavigationController?

	required init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
		self.navigationController = navigationController
		self.navigationController?.isNavigationBarHidden = true

		let view = DownloadViewController.fromStoryboard()
		view.coordinator = self
		view.tabBarItem.image = UIImage(named: Icon.download)
		view.tabBarItem.title = GlobalConstants.downloadMovies
		self.navigationController?.viewControllers = [view]

	}
}
