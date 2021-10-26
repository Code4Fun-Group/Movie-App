//
//  MoreTableViewCell.swift
//  MovieApp
//
//  Created by đông on 23/10/2021.
//

import UIKit

private enum Constants {
	static let detailCLVC = "DetailCollectionViewCell"
}

class MoreTableViewCell: UITableViewCell {

	@IBOutlet weak var progressView: UIProgressView!
	@IBOutlet weak var moreBtn: UIButton!
	@IBOutlet weak var trailersBtn: UIButton!
	@IBOutlet weak var moreCollectionView: UICollectionView!
	override func awakeFromNib() {
		super.awakeFromNib()
		// Initialization code
		setupUI()

	}

	override func setSelected(_ selected: Bool, animated: Bool) {
		super.setSelected(selected, animated: animated)
		// Configure the view for the selected state
		
	}
}

// MARK: - Private function
private extension MoreTableViewCell {
	func setupUI() {

		// MARK: - CollectionView
		moreCollectionView.delegate = self
		moreCollectionView.dataSource = self
		moreCollectionView.register(UINib(nibName: Constants.detailCLVC, bundle: Bundle.main), forCellWithReuseIdentifier: Constants.detailCLVC)
	}
}

extension MoreTableViewCell: UICollectionViewDelegate {

}

extension MoreTableViewCell: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return 1
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.detailCLVC, for: indexPath) as? DetailCollectionViewCell else { return UICollectionViewCell() }
		return cell
	}
}
