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

// MARK: - Life cycles
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	func configure(with listItem: IDownloadMovieViewModel?) {
		imageDownloadCell.linkDownloaded(from: listItem?.posterPath ?? "" )
	}
}
