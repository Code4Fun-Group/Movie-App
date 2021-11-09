//
//  SearchCoodinator.swift
//  MovieApp
//
//  Created by đông on 12/10/2021.
//

import Foundation
import UIKit

class SearchCoordinator: CoordinatorProtocol {

	var navigationController: UINavigationController?

	required init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
		self.navigationController = navigationController
		self.navigationController?.isNavigationBarHidden = false

		let view = SearchViewController.fromStoryboard()
		view.coordinator = self
		view.tabBarItem.image = UIImage(named: Icon.search)
		view.tabBarItem.title = GlobalConstants.searchMovies
		self.navigationController?.viewControllers = [view]
	}
}
