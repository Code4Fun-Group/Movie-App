//
//  TabbarViewController.swift
//  MovieApp
//
//  Created by MinhDev on 10/6/21.
//

import UIKit

class TabbarViewController: UITabBarController, Storyboarded, Coordinator {
	// MARK: - Variables
	private var homeCoordinator = HomeCoordinator()
	private var searchCoordinator = SearchCoordinator()
	private var downloadCoordinator = DownloadCoordinator()
	private var moreCoordinator = MoreCoordinator()

	var coordinator: CoordinatorProtocol?
	// MARK: - Life cycles
	override func viewDidLoad() {
		super.viewDidLoad()
		setupTabbar()
		viewControllers = [
			homeCoordinator.navigationController ?? UINavigationController(),
			searchCoordinator.navigationController ?? UINavigationController(),
			downloadCoordinator.navigationController ?? UINavigationController(),
			moreCoordinator.navigationController ?? UINavigationController()
		]
	}
}
	// MARK: - private 
extension TabbarViewController {
	private func setupTabbar() {
		tabBarController?.tabBar.itemWidth = 30.0
		tabBarController?.tabBar.barTintColor = .none
	}
}
