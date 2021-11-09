//
//  SearchCollectionViewCell.swift
//  MovieApp
//
//  Created by đông on 06/10/2021.
//

import UIKit

class SearchCollectionViewCell: UICollectionViewCell {

	// MARK: IBOutlets
	@IBOutlet weak var searchName: UILabel!
	@IBOutlet weak var searchBtn: UIButton!
	@IBOutlet weak var searchImg: UIImageView!

	override func awakeFromNib() {
		super.awakeFromNib()
	}

	func configured(movieData: SearchMovieViewModel?) {
		searchName.text = movieData?.title ?? ""
		searchImg.linkDownloaded(from: movieData?.imgUrl ?? "")
	}
}
