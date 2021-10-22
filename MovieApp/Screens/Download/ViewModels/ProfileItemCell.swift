//
//  ProfileItemCell.swift
//  MovieApp
//
//  Created by MinhDev on 10/20/21.
//

import UIKit

class ProfileItemCell: UICollectionViewCell {
// MARK: - Iboutlets
	@IBOutlet weak var imageProfile: UIImageView!
	
// MARK: - LifeCycle
	override func awakeFromNib() {
		super.awakeFromNib()
		imageProfile.image = UIImage(named: "Logo")
		self.layer.masksToBounds = true
		self.layer.cornerRadius = 5.0
		self.layer.borderWidth = 2.0
		self.layer.borderColor = UIColor.white.cgColor
	}
	
// MARK: - configure
	func configure(with listItem: IMoreMovieViewModel?) {
		imageProfile.linkDownloaded(from: listItem?.posterPath ?? "" )
	}
}
