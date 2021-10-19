//
//  SearchDetailCell.swift
//  MovieApp
//
//  Created by đông on 09/10/2021.
//

import UIKit
import Kingfisher

private enum Constants {
	static let imgBaseUrl = "https://image.tmdb.org/t/p/w500"
}

class SearchDetailCell: UICollectionViewCell {

	// MARK: IBOutlets
	@IBOutlet weak var img: UIImageView!
	@IBOutlet weak var searchName: UILabel!

	// MARK: 
	override func awakeFromNib() {
		super.awakeFromNib()
		searchName.textColor = .white
	}

	func configured(movieData: SearchMovieViewModel?) {
		searchName.text = movieData?.title ?? ""
		let url = URL(string: Constants.imgBaseUrl + (movieData?.imgUrl ?? ""))
		img.kf.setImage(with: url)
	}

}
