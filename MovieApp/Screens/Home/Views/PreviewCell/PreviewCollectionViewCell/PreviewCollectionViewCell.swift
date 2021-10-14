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
	// MARK: - LifeCycle
	override func awakeFromNib() {
		super.awakeFromNib()
		imagePreview.layer.borderWidth = 1
		imagePreview.layer.cornerRadius = imagePreview.frame.size.width / 2
		self.backgroundColor = .black
	}
	// MARK: - configure
	func configure(with listItem: MovieViewModel?) {
		imagePreview.downloaded(from: listItem?.posterPath ?? "" )
	}
}
