Pod::Spec.new do |s|
  s.name = "LookInsideServer"
  s.version = "1.2.0"
  s.summary = "LookInside runtime server for debuggable iOS, tvOS, watchOS and macOS apps."
  s.homepage = "https://github.com/LookInsideApp/LookInside-Release"
  s.license = { :type => "MIT" }
  s.authors = { "LookInside" => "support@lookinside-app.com" }
  s.source = { :git => "https://github.com/LookInsideApp/LookInside-Release.git", :tag => s.version.to_s }
  s.ios.deployment_target = "15.0"
  s.osx.deployment_target = "14.0"
  s.tvos.deployment_target = "15.0"
  s.watchos.deployment_target = "10.0"
  s.swift_versions = ["5.9"]
  s.vendored_frameworks = "LookInsideServer.xcframework"
  s.prepare_command = <<-CMD
set -eu
curl -L -o LookInsideServer.xcframework.zip "https://github.com/LookInsideApp/LookInside-Release/releases/download/1.2.0/LookInsideServer.xcframework.zip"
echo "d26a7e791e522cd51c0c3992faba51cbd797fea348465944e4d4c014f54e6f16  LookInsideServer.xcframework.zip" | shasum -a 256 -c -
rm -rf LookInsideServer.xcframework
ditto -x -k LookInsideServer.xcframework.zip .
rm LookInsideServer.xcframework.zip
  CMD
end
