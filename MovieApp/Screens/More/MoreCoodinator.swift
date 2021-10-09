//
//  MoreCoodinator.swift
//  MovieApp
//
//  Created by MinhDev on 10/8/21.
//

import Foundation
import UIKit

class MoreCoordinator: CoordinatorProtocol {
	// MARK: - Variavles
	var navigationController: UINavigationController?

	required init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
		self.navigationController = navigationController
		self.navigationController?.isNavigationBarHidden = true

		let view = MoreViewController.fromStoryboard()
		view.coordinator = self
		view.tabBarItem.image = UIImage(named: Icon.more)
		view.tabBarItem.title = GlobalConstants.more
		self.navigationController?.viewControllers = [view]

	}
}
