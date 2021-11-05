//
//  StandardTableViewCell.swift
//  MovieApp
//
//  Created by MinhDev on 10/20/21.
//

import UIKit

class StandardTableViewCell: UITableViewCell {

// MARK: - Iboutlets
	@IBOutlet private weak var labelStandardCell: UILabel!

// MARK: - configure
	func configure(cellViewModel: String) {
		labelStandardCell.text = cellViewModel
	}
}