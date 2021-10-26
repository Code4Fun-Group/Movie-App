//
//  DetailTableViewCell.swift
//  MovieApp
//
//  Created by đông on 22/10/2021.
//

import UIKit

class DetailTableViewCell: UITableViewCell {

	// MARK: - IBOutlet
	@IBOutlet weak var img: UIImageView!
	@IBOutlet weak var processLbl: UILabel!
	@IBOutlet weak var ageLbl: UILabel!
	@IBOutlet weak var yearLbl: UILabel!
	@IBOutlet weak var timeLbl: UILabel!
	@IBOutlet weak var playBtn: UIButton!
	@IBOutlet weak var downloadBtn: UIButton!
	@IBOutlet weak var overview: UILabel!
	@IBOutlet weak var starring: UILabel!
	@IBOutlet weak var director: UILabel!
	@IBOutlet weak var myList: UIButton!
	@IBOutlet weak var rateBtn: UIButton!
	@IBOutlet weak var shareBtn: UIButton!

	// MARK: - Life cycles
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code

	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)

		// Configure the view for the selected state

	}
}
