//
//  MoreViewModel.swift
//  MovieApp
//
//  Created by MinhDev on 10/6/21.
//

import Foundation

protocol IMoreViewModel {
	var sectionsMore: [MoreCell] { get }
	func getMore()
}

class MoreViewModel {
	weak var viewController: IMoreViewController?
	var moreViewModels = [MoreMovieViewModel]()
	init(viewController: IMoreViewController) {
		self.viewController = viewController
	}
}

// MARK: - IMoreViewModel
extension MoreViewModel: IMoreViewModel {
	var sectionsMore: [MoreCell] {
		return [
			.profile(identifer: "ProfileTableViewCell", title: "Profile"),
			.shared(identifer: "SharedTableViewCell", title : "Shared"),
			.mylist(identifer: "MyListTableViewCell", title: "MyList"),
			.appsetting(identifer: "StandardTableViewCell", title: "AppSetting"),
			.account(identifer: "StandardTableViewCell", title: "Account"),
			.help(identifer: "StandardTableViewCell", title: "Help"),
			.signout(identifer: "StandardTableViewCell", title: "SignOut")
		]
	}
	func getMore() {
		DependencyResolver.shared.movieAPIService.getMovies { [weak self] result in
			guard let self = self else { return }
			switch result {
			case .success(let movies):
				self.moreViewModels = movies.compactMap({
					MoreMovieViewModel(item: $0)
				})
				self.viewController?.showMovies()
			case .failure(let error):
				self.viewController?.showError(error.localizedDescription)
			}
		}
	}
}
