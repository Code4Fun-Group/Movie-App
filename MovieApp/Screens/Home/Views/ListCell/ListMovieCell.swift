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
	weak var delegate: clickedCell?
	var listData = [MovieViewModel]() {
		didSet {
			collectionListView.reloadData()
		}
	}

	// MARK: - Life cycles
	override func awakeFromNib() {
		super.awakeFromNib()
		collectionListView.delegate = self
		collectionListView.dataSource = self
		collectionListView.register(UINib(nibName: ConstantsCell.listItemCellCV, bundle: Bundle.main), forCellWithReuseIdentifier: ConstantsCell.listItemCellCV)
		
	}
	// MARK: - configure
	func configure(with listMovie: [MovieViewModel]) {
		self.listData = listMovie
	}
}
	// MARK: - UICollectionViewDataSource
extension ListMovieCell: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return listData.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = self.collectionListView.dequeueReusableCell(withReuseIdentifier: ConstantsCell.listItemCellCV, for: indexPath) as? ListItemCellCV else { return UICollectionViewCell() }
		cell.configure(with: listData[indexPath.row])
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
