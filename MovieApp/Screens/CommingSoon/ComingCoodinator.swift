//
//  ComingCoodinator.swift
//  MovieApp
//
//  Created by MinhDev on 10/9/21.
//

import Foundation
import UIKit

class ComingCoordinator: CoordinatorProtocol {

	var navigationController: UINavigationController?

	required init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
		self.navigationController = navigationController
		self.navigationController?.isNavigationBarHidden = true

		let view = ComingSoonViewController.fromStoryboard()
		view.coordinator = self
		view.tabBarItem.image = UIImage(named: Icon.coming)
		view.tabBarItem.title = GlobalConstants.comingMovies
		self.navigationController?.viewControllers = [view]

	}
}
