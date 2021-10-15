//
//  ImageDownload.swift
//  MovieApp
//
//  Created by MinhDev on 10/10/21.
//

import UIKit

extension UIImageView {
// MARK: - Imagedowload
	func downloaded(from url: URL) {
		let session = URLSession.shared
		let task = session.dataTask(with: url) { data, response, error in
			guard
				let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
				let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
				let data = data, error == nil,
				let image = UIImage(data: data)
				else { return }
			DispatchQueue.main.async { [weak self] in
				self?.image = image
			}
		}
		task.resume()
	}

	func linkDownloaded(from link: String) {
		guard let url = URL(string: "\(Config.imageUrl)\(link)") else { return }
		downloaded(from: url)
	}
}

// MARK: - CircleImagedowload
extension UIImageView {
	func cirleDownload(from url: URL) {
		let session = URLSession.shared
		let task = session.dataTask(with: url) { data, response, error in
			guard
				let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
				let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
				let data = data, error == nil,
				let image = UIImage(data: data)
				else { return }
			DispatchQueue.main.async { [weak self] in
				self?.image = image.circleMask()
			}
		}
		task.resume()
	}

	func linkCircle(from link: String) {
		guard let url = URL(string: "\(Config.imageUrl)\(link)") else { return }
		cirleDownload(from: url)
	}
}

// MARK: - Circle
extension UIImage {
	func circleMask() -> UIImage? {
		let square = CGSize(width: min(size.width, size.height), height: min(size.width, size.height))
		let imageView = UIImageView(frame: .init(origin: .init(x: 0, y: 0), size: square))
		imageView.contentMode = .scaleAspectFill
		imageView.image = self
		imageView.layer.cornerRadius = square.width / 2
		imageView.layer.borderColor = UIColor.white.cgColor
		imageView.layer.borderWidth = 5
		imageView.layer.masksToBounds = true
		UIGraphicsBeginImageContextWithOptions(imageView.bounds.size, false, scale)
		defer { UIGraphicsEndImageContext() }
		guard let context = UIGraphicsGetCurrentContext() else { return nil }
		imageView.layer.render(in: context)
		return UIGraphicsGetImageFromCurrentImageContext()
	}
}
