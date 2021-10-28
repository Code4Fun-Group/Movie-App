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
	
// MARK: - lifeCycle
	override func awakeFromNib() {
		super.awakeFromNib()
		self.layer.masksToBounds = true
		self.layer.cornerRadius = 5.0
		self.layer.borderWidth = 2.0
		self.layer.borderColor = UIColor.white.cgColor
	}
	
// MARK: - configure
	func configure(with listItem: IMovieViewModel?) {
		imageContinueItemCell.linkDownloaded(from: listItem?.posterPath ?? "" )
	}
}
