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
	weak var delegate: CellDelegate?
	private var continueData = [IMovieViewModel]() {
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
	func configure(with continueMovie: [IMovieViewModel]) {
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
		cell.layer.borderColor = UIColor.white.cgColor
		return cell
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ContinueCell: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width / 3.0, height: collectionView.frame.height)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 5.0
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 5.0
	}
}
// MARK: - UICollectionViewDelegate
extension ContinueCell: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		self.delegate?.goDetailView(celldata: continueData[indexPath.row])
	}
}
