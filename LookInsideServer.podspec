Pod::Spec.new do |s|
  s.name = "LookInsideServer"
  s.version = "0.2.7"
  s.summary = "LookInside runtime server for debuggable iOS and macOS apps."
  s.homepage = "https://github.com/LookInsideApp/LookInside-Release"
  s.license = { :type => "MIT" }
  s.authors = { "LookInside" => "support@lookinside-app.com" }
  s.source = { :git => "https://github.com/LookInsideApp/LookInside-Release.git", :tag => s.version.to_s }
  s.ios.deployment_target = "13.0"
  s.osx.deployment_target = "14.0"
  s.swift_versions = ["5.9"]
  s.vendored_frameworks = "LookInsideServer.xcframework"
  s.prepare_command = <<-CMD
set -eu
curl -L -o LookInsideServer.xcframework.zip "https://github.com/LookInsideApp/LookInside-Release/releases/download/0.2.7/LookInsideServer.xcframework.zip"
echo "38cf5f177b6743e056b60d5cdd199f90e56ce13a3e1d3b6519fe119193cca274  LookInsideServer.xcframework.zip" | shasum -a 256 -c -
rm -rf LookInsideServer.xcframework
ditto -x -k LookInsideServer.xcframework.zip .
rm LookInsideServer.xcframework.zip
  CMD
end
