//
//  SearchDetailCell.swift
//  MovieApp
//
//  Created by đông on 09/10/2021.
//

import UIKit

private enum ConstantSearch {
	static let imgBaseUrl = "https://image.tmdb.org/t/p/w500"
}

class SearchDetailCell: UICollectionViewCell {

	// MARK: IBOutlets
	@IBOutlet weak var img: UIImageView!
	@IBOutlet weak var searchName: UILabel!

	// MARK: 
	override func awakeFromNib() {
		super.awakeFromNib()
	}

	func configured(searchData: ISearchMovieViewModel?) {
		searchName.text = searchData?.title ?? ""
		img.linkDownloaded(from: searchData?.imgUrl ?? "")
	}

}
