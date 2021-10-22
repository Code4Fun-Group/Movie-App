//
//  SharedTableViewCell.swift
//  MovieApp
//
//  Created by MinhDev on 10/20/21.
//

import UIKit

class SharedTableViewCell: UITableViewCell {

// MARK: - Iboutlets
	@IBOutlet private weak var labelShared1: UILabel!
	@IBOutlet private weak var labelShared2: UILabel!
	@IBOutlet private weak var labelShared3: UILabel!
	@IBOutlet private weak var copyButton: UIButton!
	@IBOutlet private weak var textShared: UITextField!
	@IBOutlet private weak var moreButton: UIButton!
	@IBOutlet private weak var whatappButton: UIButton!
	@IBOutlet private weak var facebookButton: UIButton!
	@IBOutlet private weak var mailButton: UIButton!

// MARK: - Life Cycle
	override func awakeFromNib() {
		super.awakeFromNib()
		textShared.text = "https://code4fun.group/movies"
}
}
