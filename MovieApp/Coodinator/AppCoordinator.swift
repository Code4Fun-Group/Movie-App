//
//  AppCoordinator.swift
//  MovieApp
//
//  Created by MinhDev on 10/8/21.
//

import Foundation
import UIKit

class AppCoordinator: CoordinatorProtocol {
	// MARK: - Private properties

	private var window: UIWindow?
	private var navigationController: UINavigationController?

	required init(_ window: UIWindow?, navigationController: UINavigationController?) {
		self.window = window
		self.navigationController = navigationController
	}

	func tabbarController() {
		let view = TabbarViewController.fromStoryboard()
		view.coordinator = self
		navigationController?.setViewControllers([view], animated: true)

		navigationController?.isNavigationBarHidden = true
		window?.rootViewController = navigationController
		window?.makeKeyAndVisible()
	}

	func homeViewController() {
		let view = HomeViewController.fromStoryboard()
		view.coordinator = self
		navigationController?.setViewControllers([view], animated: true)

		navigationController?.isNavigationBarHidden = true
	}

	func searchViewController() {
		let view = SearchViewController.fromStoryboard()
		view.coordinator = self
		navigationController?.setViewControllers([view], animated: true)

		navigationController?.isNavigationBarHidden = true
	}

	func comingViewController() {
		let view = ComingSoonViewController.fromStoryboard()
		view.coordinator = self
		navigationController?.setViewControllers([view], animated: true)

		navigationController?.isNavigationBarHidden = true
	}
	
	func downloadViewController() {
		let view = DownloadViewController.fromStoryboard()
		self.navigationController?.pushViewController(view, animated: true)

		navigationController?.isNavigationBarHidden = true
	}

	func moreViewController() {
		let view = MoreViewController.fromStoryboard()
		self.navigationController?.pushViewController(view, animated: true)

		navigationController?.isNavigationBarHidden = true
	}
}
