Pod::Spec.new do |spec|
  spec.name         = "Model"
  spec.version      = "1.0"
  spec.summary      = "Model Framework"
  spec.description  = <<-DESC
  Common Model
DESC

  spec.homepage     = "https://www.code4fun.group"
  spec.license      = { :type => 'MIT', :file => 'LICENSE' }
  spec.author       = { "Code4Fun" => "namnh.code4fun@gmail.com" }
  spec.ios.deployment_target = "12.4"

  spec.source       = { :git => "http://github/Model.git", :tag => spec.version.to_s }
  spec.source_files = 'Model/**/*.{swift,h}'

  spec.dependency 'Common'
end
