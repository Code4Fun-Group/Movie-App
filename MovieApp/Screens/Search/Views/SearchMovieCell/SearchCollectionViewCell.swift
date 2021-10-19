//
//  SearchCollectionViewCell.swift
//  MovieApp
//
//  Created by đông on 06/10/2021.
//

import UIKit
import Kingfisher

private enum Constants {
	static let imgBaseUrl = "https://image.tmdb.org/t/p/w500"
}

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
		let url = URL(string: Constants.imgBaseUrl + (movieData?.imgUrl ?? ""))
		searchImg.kf.setImage(with: url)
	}
}
