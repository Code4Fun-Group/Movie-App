//
//  HomeMovieCell.swift
//  MovieApp
//
//  Created by NamNH on 30/09/2021.
//

import UIKit

class HomeMovieCell: UITableViewCell {
	// MARK: - IOutlets
	@IBOutlet private weak var logo: UIImageView!
	@IBOutlet private weak var tvShowButton: UIButton!
	@IBOutlet private weak var movieButton: UIButton!
	@IBOutlet private weak var myListButton: UIButton!
	@IBOutlet private weak var titleMovieLabel: UILabel!
	@IBOutlet private weak var infoMovieLabel: UILabel!
	@IBOutlet private weak var playButton: UIButton!
	@IBOutlet private weak var infoButton: UIButton!
	@IBOutlet private weak var addMyListButton: UIButton!
	@IBOutlet private weak var imageHomeMovieCell: UIImageView!
	// MARK: - Life cycles
	override func awakeFromNib() {
		super.awakeFromNib()
	}
	// MARK: - configure
	func configure(cellViewModel: MovieViewModel?) {
		titleMovieLabel.text = cellViewModel?.title ?? ""
		imageHomeMovieCell.downloaded(from: cellViewModel?.posterPath ?? "")
		infoMovieLabel.text = cellViewModel?.mediaType ?? ""
	}
}
