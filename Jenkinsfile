#!/usr/bin/env groovy

pipeline {
  agent { 
    label 'slave-macos'
  }

  options {
    disableConcurrentBuilds()
  }

  stages {
    stage("Initialize") {
      steps {
        sh """
        bundle install 
        bundle exec fastlane initLane
        """
      }
    }
    stage("Swiftlint") {
      steps {
        sh "bundle exec fastlane swiftLintLane"
	  }
    }
    stage("Xcode Build") {
      steps {
        sh "bundle exec fastlane debugLane"
      }
    }
    stage("Danger") {
      steps { 
		withCredentials([string(credentialsId: 'GITHUB_PERSONAL_TOKEN', variable: 'GITHUB_PERSONAL_TOKEN')]
		{
		  sh """
		  export DANGER_GITHUB_API_TOKEN="${GITHUB_PERSONAL_TOKEN}"
		  bundle exec fastlane  dangerLane
		  """
		}
	  }
	}
  }
}
