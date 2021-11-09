//
//  SearchCollectionReusableView.swift
//  MovieApp
//
//  Created by đông on 14/10/2021.
//

import UIKit

class SearchCollectionReusableView: UICollectionReusableView {
	static let searchCollectionReusableView = "SearchCollectionReusableView"

	// MARK: IBOutlets
	@IBOutlet weak var headerName: UILabel!
	@IBOutlet weak var switchBtn: UIButton!
	override func awakeFromNib() {
		super.awakeFromNib()
		headerName.text = "Popular Searches"
		headerName.textColor = .white
		
	}

	func configure() {
		backgroundColor = .black
	}
	
	@IBAction func switchBtn(_ sender: Any) {
		
	}
}
