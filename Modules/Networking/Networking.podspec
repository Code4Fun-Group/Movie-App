Pod::Spec.new do |spec|
	spec.name         = "Networking"
	spec.version      = "1.0"
	spec.summary      = "Networking Framework"
	spec.description  = <<-DESC
	Networking
	DESC
	
	spec.homepage     = "https://www.code4fun.group"
	spec.license      = { :type => 'MIT', :file => 'LICENSE' }
	spec.author       = { "Code4Fun" => "namnh.code4fun@gmail.com" }
	spec.ios.deployment_target = "12.4"
	
	spec.source       = { :git => "https://github.com/Code4Fun-Group/Networking.git", :tag => spec.version.to_s }
	spec.source_files = 'Networking/**/*.{swift,h}'
	
	spec.dependency 'Common'
	spec.dependency 'Model'
	spec.dependency 'Alamofire'
end

