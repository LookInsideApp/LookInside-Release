Pod::Spec.new do |s|
  s.name = "LookInsideServer"
  s.version = "0.2.2"
  s.summary = "LookInside runtime server for debuggable iOS and macOS apps."
  s.homepage = "https://github.com/LookInsideApp/LookInside-Release"
  s.license = { :type => "MIT" }
  s.authors = { "LookInside" => "support@lookinside-app.com" }
  s.source = {
    :http => "https://github.com/LookInsideApp/LookInside-Release/releases/download/#{s.version}/LookInsideServer.xcframework.zip",
    :sha256 => "7a54f2a6292dcd127be26d181878f809cae90cdbcd65f47e1b9eb59e6776f860"
  }
  s.ios.deployment_target = "13.0"
  s.osx.deployment_target = "14.0"
  s.swift_versions = ["5.9"]
  s.vendored_frameworks = "LookInsideServer.xcframework"
end
