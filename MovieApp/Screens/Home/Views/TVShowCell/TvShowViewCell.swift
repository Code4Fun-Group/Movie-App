//
//  TvShowViewCell.swift
//  MovieApp
//
//  Created by MinhDev on 10/5/21.
//

import UIKit

class TvShowViewCell: UITableViewCell {

// MARK: - IbOutlet
	@IBOutlet private weak var titleTvShow: UILabel!
	@IBOutlet private weak var imageTvShow: UIImageView!
	@IBOutlet private weak var playTvShowButton: UIButton!
	@IBOutlet private weak var myListTvShowButton: UIButton!
// MARK: - Life cycles
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
}
