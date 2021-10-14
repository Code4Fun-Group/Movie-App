//
//  ContinueItemCell.swift
//  MovieApp
//
//  Created by MinhDev on 10/13/21.
//

import UIKit

class ContinueItemCell: UICollectionViewCell {
	// MARK: - Iboutlets
	@IBOutlet weak var imageContinueItemCell: UIImageView!
	@IBOutlet weak var infoContinue: UIButton!
	@IBOutlet weak var moreContinue: UIButton!
	override func awakeFromNib() {
		super.awakeFromNib()
		self.backgroundColor = .black
	}
	// MARK: - configure
	func configure(with listItem: MovieViewModel?) {
		imageContinueItemCell.downloaded(from: listItem?.posterPath ?? "" )
	}
}
