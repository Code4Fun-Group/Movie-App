//
//  DetailsViewController.swift
//  MovieApp
//
//  Created by MinhDev on 10/6/21.
//

import UIKit

protocol IDetailViewController: AnyObject {
	func showMovies()
	func showError(_ errorMessage: String)
}

class DetailsViewController: BaseViewController {
	// MARK: - IBOutlet
	@IBOutlet weak var downloadBtn: UIButton!
	@IBOutlet weak var img: UIImageView!
	@IBOutlet weak var overview: UILabel!
	@IBOutlet weak var playBtn: UIButton!
	// MARK: - Variables
	var detailData: HomeDetailViewModel?
	// MARK: - Life cycles
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		self.navigationController?.isNavigationBarHidden = false
		self.tabBarController?.tabBar.isHidden = false
	}

	override func viewDidLoad() {
		super.viewDidLoad()
//		overview.text = detailData?.title
		print("detail = \(detailData?.detailMovieViewModels)")
//		img.linkDownloaded(from: <#T##String#>)
	}

	override func viewWillDisappear(_ animated: Bool) {
		super.viewWillDisappear(animated)
		self.navigationController?.isNavigationBarHidden = true
		self.tabBarController?.tabBar.isHidden = false
	}
}
