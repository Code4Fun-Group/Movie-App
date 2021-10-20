//
//  ListMovieCell.swift
//  MovieApp
//
//  Created by MinhDev on 10/5/21.
//

import UIKit
import Model

class ListMovieCell: UITableViewCell {
// MARK: - Outlets
	@IBOutlet private weak var collectionListView: UICollectionView!

// MARK: - Variables
	 weak var delegate: CellDelegate?
	private var listData = [IMovieViewModel]() {
		didSet {
			collectionListView.reloadData()
		}
	}

// MARK: - Life cycles
	override func awakeFromNib() {
		super.awakeFromNib()
		collectionListView.delegate = self
		collectionListView.dataSource = self
		collectionListView.register(UINib(nibName: ConstantsCell.listItemCell, bundle: Bundle.main), forCellWithReuseIdentifier: ConstantsCell.listItemCell)
		
	}

// MARK: - configure
	func configure(with listMovie: [IMovieViewModel]) {
		self.listData = listMovie
	}
}

// MARK: - UICollectionViewDataSource
extension ListMovieCell: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return listData.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = self.collectionListView.dequeueReusableCell(withReuseIdentifier: ConstantsCell.listItemCell, for: indexPath) as? ListItemCell else { return UICollectionViewCell() }
		cell.configure(with: listData[indexPath.row])
		cell.layer.masksToBounds = true
		cell.layer.cornerRadius = 5
		cell.layer.borderWidth = 2
		cell.layer.borderColor = UIColor.white.cgColor
		return cell
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
extension ListMovieCell: UICollectionViewDelegateFlowLayout {
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

// MARK: - UICollectionViewDelegate
extension ListMovieCell: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		self.delegate?.goDetailView(celldata: listData[indexPath.row])
	}
}
