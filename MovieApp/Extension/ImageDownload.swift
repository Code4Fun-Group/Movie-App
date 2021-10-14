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

	func downloaded(from link: String) {
		guard let url = URL(string: "\(Config.imageUrl)\(link)") else { return }
		downloaded(from: url)
	}
}
