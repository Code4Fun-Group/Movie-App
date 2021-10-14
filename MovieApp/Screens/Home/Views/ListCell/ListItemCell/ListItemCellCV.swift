//
//  ListItemCellCV.swift
//  MovieApp
//
//  Created by MinhDev on 10/12/21.
//

import UIKit
import Model

class ListItemCellCV: UICollectionViewCell {
	// MARK: - IbOutlets
	@IBOutlet private weak var imageListItem: UIImageView!
	// MARK: - Life cycles
	override func awakeFromNib() {
		super.awakeFromNib()
		imageListItem.image = UIImage(named: "image 2")
		
	}
	// MARK: - configure
	func configure(with listItem: MovieViewModel?) {
		imageListItem.downloaded(from: listItem?.posterPath ?? "" )
	}
}
