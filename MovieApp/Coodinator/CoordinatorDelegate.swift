//
//  Coordinator.swift
//  MovieApp
//
//  Created by MinhDev on 10/7/21.
//

import UIKit

protocol Coordinator: UIViewController {
	// MARK: - Variables
	var coordinator: CoordinatorProtocol? { get set }
}
