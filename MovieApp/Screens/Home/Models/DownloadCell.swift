//
//  DownloadCell.swift
//  MovieApp
//
//  Created by MinhDev on 10/19/21.
//

import UIKit

class DownloadCell: UICollectionViewCell {
// MARK: - Iboutlets
	@IBOutlet private weak var imageDownloadCell: UIImageView!

// MARK: - LifeCycle
	override func awakeFromNib() {
		super.awakeFromNib()
		self.layer.masksToBounds = true
		self.layer.cornerRadius = 5.0
		self.layer.borderWidth = 2.0
		self.layer.borderColor = UIColor.white.cgColor
		}

// MARK: - functions
	func configure(with listItem: IDownloadMovieViewModel?) {
		imageDownloadCell.linkDownloaded(from: listItem?.posterPath ?? "" )
	}
}
