//
//  ListMovieCell.swift
//  MovieApp
//
//  Created by MinhDev on 10/5/21.
//

import UIKit

class ListMovieCell: UITableViewCell {
	
        // MARK: - Outlets
	@IBOutlet private weak var imageListMovieCell: UIImageView!
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
	}
	
	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		// Configure the view for the selected state
	}
	
}
