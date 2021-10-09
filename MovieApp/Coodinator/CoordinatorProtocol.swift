//
//  AppCoordinator.swift
//  MovieApp
//
//  Created by MinhDev on 10/7/21.
//

import Foundation
import UIKit

protocol CoordinatorProtocol: AnyObject {

	init(_ window: UIWindow?, navigationController: UINavigationController?)
	
	func tabbarController()
	func homeViewController()
	func searchViewController()
	func comingViewController()
	func downloadViewController()
	func moreViewController()

}

extension CoordinatorProtocol {
	func tabbarController() { }
	func homeViewController() { }
	func searchViewController() { }
	func comingViewController() { }
	func downloadViewController() { }
	func moreViewController() { }
}
