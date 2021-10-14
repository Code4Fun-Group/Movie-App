//
//  ContinueCell.swift
//  MovieApp
//
//  Created by MinhDev on 10/5/21.
//

import UIKit

class ContinueCell: UITableViewCell {
	// MARK: - Outlets
	@IBOutlet weak var continueCollectionView: UICollectionView!
	// MARK: - Variable
	weak var delegate: clickedCell?
	var continueData = [MovieViewModel]() {
		didSet {
			continueCollectionView.reloadData()
		}
	}
	// MARK: - Life cycles
	override func awakeFromNib() {
		super.awakeFromNib()
		continueCollectionView.delegate = self
		continueCollectionView.dataSource = self
		continueCollectionView.register(UINib(nibName: ConstantsCell.continueItemCell, bundle: Bundle.main), forCellWithReuseIdentifier: ConstantsCell.continueItemCell)
	}
	// MARK: - configure
	func configure(with continueMovie: [MovieViewModel]) {
		self.continueData = continueMovie
	}
}
	// MARK: - Life UICollectionViewDataSource
extension ContinueCell: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return continueData.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = self.continueCollectionView.dequeueReusableCell(withReuseIdentifier: ConstantsCell.continueItemCell, for: indexPath) as? ContinueItemCell else { return UICollectionViewCell() }
		cell.configure(with: continueData[indexPath.row])
		return cell
	}
}
	// MARK: - UICollectionViewDelegateFlowLayout
extension ContinueCell: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width / 3, height: collectionView.frame.height)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 5
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 5
	}
}
