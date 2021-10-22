//
//  MoreConstants.swift
//  MovieApp
//
//  Created by MinhDev on 10/22/21.
//

import Foundation

// MARK: - Enum
enum ConstantsCellMore {
	static let profileCell = "ProfileTableViewCell"
	static let sharedCell = "SharedTableViewCell"
	static let myListCell = "MyListTableViewCell"
	static let standardCell = "StandardTableViewCell"
}

enum MoreCell: String, CaseIterable {
	case detail, shared, mylist, appsetting, account, help, signout
}

 extension MoreCell {
	func title() -> String {
		switch self {
		case .detail:
			return "Detail"
		case .shared:
			return "Shared"
		case .mylist:
			return "Mylist"
		case .appsetting:
			return "Appsetting"
		case .account:
			return "Account"
		case .help:
			return "Help"
		case .signout:
			return "Signout"

		}
	}
}
