//
//  PreviewCollectionViewCell.swift
//  MovieApp
//
//  Created by MinhDev on 10/12/21.
//

import UIKit

class PreviewCollectionViewCell: UICollectionViewCell {
	
// MARK: - Outlets
	@IBOutlet weak var imagePreview: UIImageView!
	@IBOutlet weak var labelPreview: UILabel!

// MARK: - LifeCycle
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	
// MARK: - configure
	func configure(with listItem: IMovieViewModel?) {
		imagePreview.linkCircle(from: listItem?.posterPath ?? "" )
		labelPreview.text = listItem?.title ?? ""
	}
}
