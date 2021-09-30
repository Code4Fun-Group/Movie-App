// This file contains the fastlane.tools configuration
// You can find the documentation at https://docs.fastlane.tools
//
// For a list of all available actions, check out
//
//     https://docs.fastlane.tools/actions
//

import Foundation

class Fastfile: LaneFile {
	var isCI: Bool {
		return environmentVariable(get: "CI") == "true" ? true : false
	}
	
	func initLane() {
		desc("Run Initial")
		
		// Run 'pod install'
		cocoapods()
	}
	func swiftLintLane() {
		desc("Run SwiftLint")
		
		swiftlint(configFile: ".swiftlint.yml",
				  strict: true,
				  ignoreExitStatus: false,
				  raiseIfSwiftlintError: true,
				  executable: "Pods/SwiftLint/swiftlint"
		)
	}
	
	func dangerLane() {
		desc("Run Danger")
		
		danger(dangerfile: "Dangerfile",
			   githubApiToken: .fastlaneDefault(environmentVariable(get: "DANGER_GITHUB_API_TOKEN")),
			   newComment: .fastlaneDefault(true),
			   removePreviousComments: .fastlaneDefault(true)
		)
	}
	
	func debugLane() {
		desc("Build debug")
		
		buildApp(workspace: "\(environmentVariable(get: "APP_NAME")).xcworkspace",
				 scheme: .fastlaneDefault("\(environmentVariable(get: "APP_NAME")) Development"),
				 clean: .fastlaneDefault(true),
				 skipPackageIpa: .fastlaneDefault(true),
				 exportMethod: .fastlaneDefault("development"),
				 skipArchive: .fastlaneDefault(true),
				 skipCodesigning: .fastlaneDefault(true),
				 derivedDataPath: .fastlaneDefault("./DerivedData"),
				 analyzeBuildTime: .fastlaneDefault(true))
	}
}

protocol Configuration {
	var exportMethod: String { get }
	var buildConfiguration: String { get }
	var targetSchemeName: String { get }
	var bundleIdentifier: String { get }
}
