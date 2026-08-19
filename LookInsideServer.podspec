Pod::Spec.new do |s|
  s.name = "LookInsideServer"
  s.version = "0.2.8"
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
curl -L -o LookInsideServer.xcframework.zip "https://github.com/LookInsideApp/LookInside-Release/releases/download/0.2.8/LookInsideServer.xcframework.zip"
echo "645ae9428eac83048d301dfb879072a2d2fed2e1f8d3f54d8a3d3a3e085aed8f  LookInsideServer.xcframework.zip" | shasum -a 256 -c -
rm -rf LookInsideServer.xcframework
ditto -x -k LookInsideServer.xcframework.zip .
rm LookInsideServer.xcframework.zip
  CMD
end
