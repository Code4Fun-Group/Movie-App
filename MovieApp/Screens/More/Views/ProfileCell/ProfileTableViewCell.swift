//
//  ProfileTableViewCell.swift
//  MovieApp
//
//  Created by MinhDev on 10/20/21.
//

import UIKit

private enum ConstantsCellProfile {
	static let profileItemCell = "ProfileItemCell"
}

class ProfileTableViewCell: UITableViewCell {
// MARK: - Iboutlets
	@IBOutlet private weak var profileItem: UICollectionView!
	@IBOutlet private weak var managerButton: UIButton!

// MARK: - Variable
	private var profileData = [IMoreMovieViewModel]() {
		didSet {
			profileItem.reloadData()
		}
	}

// MARK: - configure
		func configure(with moreMovie: [IMoreMovieViewModel]) {
			self.profileData = moreMovie
		}

// MARK: - LifeCycle
	override func awakeFromNib() {
		super.awakeFromNib()
		self.managerButton.titleLabel?.text = "Mannger Profile"
		self.managerButton.titleLabel?.textColor = .black
		self.profileItem.delegate = self
		self.profileItem.dataSource = self
		profileItem.register(UINib(nibName: ConstantsCellProfile.profileItemCell, bundle: Bundle.main), forCellWithReuseIdentifier: ConstantsCellProfile.profileItemCell)
	}
}

// MARK: - Life UICollectionViewDataSource
extension ProfileTableViewCell: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return profileData.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = self.profileItem.dequeueReusableCell(withReuseIdentifier: ConstantsCellProfile.profileItemCell, for: indexPath) as? ProfileItemCell else { return UICollectionViewCell() }
		cell.configure(with: profileData[indexPath.row])
		return cell
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ProfileTableViewCell: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width / ConstraintCells.sizeItem, height: collectionView.frame.height)
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return ConstraintCells.lineSpace
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return ConstraintCells.interItem
	}
}

// MARK: - UICollectionViewDelegate
extension ProfileTableViewCell: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
	}
}