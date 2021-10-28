//
//  ListItemCellCV.swift
//  MovieApp
//
//  Created by MinhDev on 10/12/21.
//

import UIKit
import Model

class ListItemCell: UICollectionViewCell {
// MARK: - IbOutlets
	@IBOutlet private weak var imageListItem: UIImageView!

// MARK: - Life cycles
	override func awakeFromNib() {
		super.awakeFromNib()
		self.layer.masksToBounds = true
		self.layer.cornerRadius = 5.0
		self.layer.borderWidth = 2.0
		self.layer.borderColor = UIColor.white.cgColor
	}
	
// MARK: - configure
	func configure(with listItem: IMovieViewModel?) {
		imageListItem.linkDownloaded(from: listItem?.posterPath ?? "" )
	}
}
