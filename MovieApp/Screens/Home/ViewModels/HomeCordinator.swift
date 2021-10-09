//
//  HomeCordinator.swift
//  MovieApp
//
//  Created by MinhDev on 10/7/21.
//

import Foundation
import UIKit

class HomeCoordinator: CoordinatorProtocol {

	var navigationController: UINavigationController?

	required init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
		self.navigationController = navigationController
		self.navigationController?.isNavigationBarHidden = true

		let view = HomeViewController.fromStoryboard()
		view.coordinator = self
		view.tabBarItem.image = UIImage(named: Icon.home)
		view.tabBarItem.title = GlobalConstants.homeMovies
		self.navigationController?.viewControllers = [view]

	}
}
