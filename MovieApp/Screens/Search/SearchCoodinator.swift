//
//  SearchCoodinator.swift
//  MovieApp
//
//  Created by MinhDev on 10/8/21.
//

import Foundation
import UIKit

class SearchCoordinator: CoordinatorProtocol {
	// MARK: - Variables
	var navigationController: UINavigationController?

	required init(_ window: UIWindow? = nil, navigationController: UINavigationController? = UINavigationController()) {
		self.navigationController = navigationController
		self.navigationController?.isNavigationBarHidden = true
		
		let view = SearchViewController.fromStoryboard()
		view.coordinator = self
		view.tabBarItem.image = UIImage(named: Icon.search)
		view.tabBarItem.title = GlobalConstants.searchMovies
		self.navigationController?.viewControllers = [view]
	}
}
