//
//  PreviewCell.swift
//  MovieApp
//
//  Created by MinhDev on 10/5/21.
//

import UIKit

protocol CellDelegate: AnyObject {
	func goDetailView(celldata: IMovieViewModel)
}

class PreviewCell: UITableViewCell {
// MARK: - Iboutlets
	@IBOutlet weak var previewCollectionView: UICollectionView!

// MARK: - Variables
	weak var delegate: CellDelegate?
	private var previewData = [IMovieViewModel]() {
		didSet {
			previewCollectionView.reloadData()
		}
	}

// MARK: - Life cycles
	override func awakeFromNib() {
		super.awakeFromNib()
		previewCollectionView.delegate = self
		previewCollectionView.dataSource = self
		previewCollectionView.register(UINib(nibName: ConstantsCell.previewCollectionCell, bundle: Bundle.main), forCellWithReuseIdentifier: ConstantsCell.previewCollectionCell)
		self.backgroundColor = .black
	}

// MARK: - Life cycles
	func configure(preview: [IMovieViewModel]) {
		previewData = preview
	}
}

// MARK: - UICollectionViewDataSource
extension PreviewCell: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return previewData.count
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = previewCollectionView.dequeueReusableCell(withReuseIdentifier: ConstantsCell.previewCollectionCell, for: indexPath) as? PreviewCollectionViewCell else { return UICollectionViewCell() }
		cell.configure(with: previewData[indexPath.row])
		return cell
	}
}

// MARK: - UICollectionViewDelegateFlowLayout
extension PreviewCell: UICollectionViewDelegateFlowLayout {

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
	return CGSize(width: contentView.bounds.size.width / 3.0, height: contentView.bounds.size.height)
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
	return 10.0
}

func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
	return 10.0
}
}

// MARK: - UICollectionViewDelegate
extension PreviewCell: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		self.delegate?.goDetailView(celldata: previewData[indexPath.row])
	}
}
