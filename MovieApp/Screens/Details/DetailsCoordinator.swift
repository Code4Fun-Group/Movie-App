//
//  DetailsCoordinator.swift
//  MovieApp
//
//  Created by MinhDev on 10/14/21.
//

import Foundation
import UIKit

class DetailsCoordinator: CoordinatorProtocol {

	var navigationController: UINavigationController?

	required init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
		self.navigationController = navigationController
		self.navigationController?.isNavigationBarHidden = false

		let view = DetailsViewController.fromStoryboard()
		view.coordinator = self
		view.tabBarItem.image = UIImage(named: Icon.home)
		view.tabBarItem.title = GlobalConstants.detailsMovies
		self.navigationController?.viewControllers = [view]
	}
}
