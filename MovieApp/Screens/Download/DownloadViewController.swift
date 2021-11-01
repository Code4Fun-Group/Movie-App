//
//  DownloadViewController.swift
//  MovieApp
//
//  Created by MinhDev on 10/6/21.
//

import UIKit

protocol IDownloadViewController: AnyObject {
	func showMovies()
	func showError()
}

private enum ConstantsCellDownload {
	static let downloadCell = "DownloadCell"
}

class DownloadViewController: BaseViewController {
// MARK: - Iboutlets
	@IBOutlet private weak var downloadCollectionView: UICollectionView!
	
// MARK: - Variables
	var coordinators: CoordinatorProtocol?
	private var viewModel: DownloadViewModel?

// MARK: - Life cycles
	override func viewDidLoad() {
		super.viewDidLoad()
		viewModel = DownloadViewModel(viewController: self)
		downloadCollectionView.delegate = self
		downloadCollectionView.dataSource = self
		setupUI()
		setupTableView()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		downloadCollectionView.backgroundColor = .black
		viewModel?.getDownloadMovies()
	}
}

// MARK: - Private function
private extension DownloadViewController {
	func setupUI() {
	}

	func setupTableView() {
		downloadCollectionView.register(UINib(nibName: ConstantsCellDownload.downloadCell, bundle: Bundle.main), forCellWithReuseIdentifier: ConstantsCellDownload.downloadCell)
	}

	func downloadButton() -> UIButton {
		let button = UIButton()
		button.frame = CGRect(x: 0.0, y: 0.0, width: view.bounds.width * 0.9, height: 50.0)
		button.backgroundColor = .white
		button.titleLabel?.font = UIFont(name: "Arial", size: 15.0)
		button.setTitle("Find Something to Download", for: .normal)
		button.setTitleColor(UIColor.black, for: .normal)
		button.layer.cornerRadius = 3.0
		button.center.x = view.center.x
		button.center.y = 500.0
		return button
	}

	 func imageDownloadView() -> UIImageView {
		let img = UIImageView()
		img.frame = CGRect(x: 0.0, y: 0.0, width: 200.0, height: 200.0)
		img.contentMode = .scaleToFill
		img.layer.cornerRadius = img.frame.size.width / 2.0
		img.layer.borderWidth = 3.0
		img.layer.borderColor = UIColor.black.cgColor
		img.clipsToBounds = true
		img.image = UIImage(named: "Download Page Icon")
		img.center.x = view.center.x
		img.center.y = 300.0
		return img
	}
}

// MARK: - UICollectionViewDataSource
extension DownloadViewController: UICollectionViewDataSource {
	func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
		return viewModel?.downloadMovieViewModels.count ?? 0
	}

	func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
		guard let cell = self.downloadCollectionView.dequeueReusableCell(withReuseIdentifier: ConstantsCellDownload.downloadCell, for: indexPath) as? DownloadCell else { return UICollectionViewCell() }
		cell.configure(with: viewModel?.downloadMovieViewModels[indexPath.row])
		return cell
	}
}

// MARK: - IDownloadViewController
extension DownloadViewController: IDownloadViewController {
	func showMovies() {
		downloadCollectionView.isHidden = false
		downloadCollectionView.reloadData()
	}

	func showError() {
		downloadCollectionView.isHidden = true
		view.addSubview(imageDownloadView())
		view.addSubview(downloadButton())
	}
}
// MARK: - UICollectionViewDelegateFlowLayout
extension DownloadViewController: UICollectionViewDelegateFlowLayout {
	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
		return CGSize(width: collectionView.frame.width / 3.0, height: collectionView.frame.height / 4.0 )
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
		return 0.0
	}

	func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
		return 0.0
}
}

// MARK: - UICollectionViewDelegate

extension DownloadViewController: UICollectionViewDelegate {
	func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
		coordinators?.detailViewController()

		let change = DetailsViewController.fromStoryboard()
		self.navigationController?.pushViewController(change, animated: true)
	}
}
