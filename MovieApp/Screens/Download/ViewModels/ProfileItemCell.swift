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
	}
	func configure(with listItem: IMoreMovieViewModel?) {
		imageProfile.linkDownloaded(from: listItem?.posterPath ?? "" )
	}
}
