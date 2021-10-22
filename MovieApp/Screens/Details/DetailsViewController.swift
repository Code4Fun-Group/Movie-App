//
//  DetailsViewController.swift
//  MovieApp
//
//  Created by MinhDev on 10/6/21.
//

import UIKit

class DetailsViewController: UIViewController, Storyboarded {
	@IBOutlet weak var timeLbl: UILabel!
	@IBOutlet weak var yearLbl: UILabel!
	@IBOutlet weak var overviewDetail: UILabel!
	@IBOutlet weak var starringDetail: UILabel!
	@IBOutlet weak var directorDetail: UILabel!
	@IBOutlet weak var playBtn: UIButton!
	@IBOutlet weak var downloadBtn: UIButton!
	@IBOutlet weak var ageLbl: UILabel!
	@IBOutlet weak var processLbl: UILabel!
	@IBOutlet weak var imgDetail: UIImageView!
	// MARK: - Life cycles
	override func viewDidLoad() {
	super.viewDidLoad()
	}
}
