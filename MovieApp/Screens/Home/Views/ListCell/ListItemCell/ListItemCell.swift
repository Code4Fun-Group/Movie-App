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
	}
	
// MARK: - configure
	func configure(with listItem: IMovieViewModel?) {
		imageListItem.linkDownloaded(from: listItem?.posterPath ?? "" )
	}
}
