//
//  ContinueCell.swift
//  MovieApp
//
//  Created by MinhDev on 10/5/21.
//

import UIKit

class ContinueCell: UITableViewCell {
	
	@IBOutlet private weak var imageContinueMovieCell: UIImageView!
	@IBOutlet private weak var moreContinueButton: UIButton!
	@IBOutlet private weak var infoContinueMovieButton: UIButton!
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		// Configure the view for the selected state
	}
}
