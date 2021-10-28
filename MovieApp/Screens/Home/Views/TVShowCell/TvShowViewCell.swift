//
//  TvShowViewCell.swift
//  MovieApp
//
//  Created by MinhDev on 10/5/21.
//

import UIKit

class TvShowViewCell: UITableViewCell {

// MARK: - IbOutlet
	@IBOutlet private weak var titleTvShow: UILabel!
	@IBOutlet private weak var imageTvShow: UIImageView!
	@IBOutlet private weak var playTvShowButton: UIButton!
	@IBOutlet private weak var myListTvShowButton: UIButton!

	// MARK: - configure
		func configure(with cellViewModel: IMovieViewModel?) {
			titleTvShow.text = cellViewModel?.title ?? ""
			imageTvShow.linkDownloaded(from: cellViewModel?.backdropPath ?? "")
		}
}
