//
//  SharedTableViewCell.swift
//  MovieApp
//
//  Created by MinhDev on 10/20/21.
//

import UIKit

protocol sharedDelegate: AnyObject {
	func sharedFacebook()
	func sharedGmail()
	func sharedWhatApps()
	func sharedAlert()
}

class SharedTableViewCell: UITableViewCell {

// MARK: - Iboutlets
	@IBOutlet private weak var labelSharedTitle: UILabel!
	@IBOutlet private weak var labelSharedBody: UILabel!
	@IBOutlet private weak var labelSharedEnd: UILabel!
	@IBOutlet private weak var copyButton: UIButton!
	@IBOutlet private weak var textShared: UITextField!
	@IBOutlet private weak var moreButton: UIButton!
	@IBOutlet private weak var whatappButton: UIButton!
	@IBOutlet private weak var facebookButton: UIButton!
	@IBOutlet private weak var mailButton: UIButton!

// MARK: - Variables
	weak var viewModel: sharedDelegate?
	override func awakeFromNib() {
		super.awakeFromNib()
		setUpUI()
	}

// MARK: - Actions
	@IBAction private func coppyButtonAction(_ sender: UIButton!) {
		viewModel?.sharedAlert()
		UIPasteboard.general.string = textShared.text
	}
	@IBAction private func sharedFacebookAction(_ sender: Any) {
		viewModel?.sharedFacebook()
	}
	@IBAction private func sharedWhatAppAction(_ sender: Any) {
		viewModel?.sharedWhatApps()
	}
	@IBAction private func sharedGmailAction(_ sender: Any) {
		viewModel?.sharedGmail()
	}
}
// MARK: - Private
	extension SharedTableViewCell {
		private func setUpUI() {
			textShared.text = "https://code4fun.group/movies"
			labelSharedTitle.text = "Tell friends about Netflix."
			labelSharedBody.text = "Share this link so your friends can join the conversation around all your favorite TV shows and movies."
			labelSharedEnd.text = "Terms & condition"
			setUpbutton()
		}
		private func setUpbutton() {
			self.copyButton.layer.masksToBounds = true
			self.copyButton.layer.cornerRadius = ConstraintCells.cornerRadius
			self.copyButton.layer.borderWidth = ConstraintCells.borderWidth
			self.copyButton.layer.borderColor = UIColor.white.cgColor
			self.textShared.layer.masksToBounds = true
			self.textShared.layer.cornerRadius = ConstraintCells.cornerRadius
			self.textShared.layer.borderWidth = ConstraintCells.borderWidth
			self.textShared.layer.borderColor = UIColor.white.cgColor
		}
	}
