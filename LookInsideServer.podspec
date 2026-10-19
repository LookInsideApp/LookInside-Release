Pod::Spec.new do |s|
  s.name = "LookInsideServer"
  s.version = "1.0.2"
  s.summary = "LookInside runtime server for debuggable iOS and macOS apps."
  s.homepage = "https://github.com/LookInsideApp/LookInside-Release"
  s.license = { :type => "MIT" }
  s.authors = { "LookInside" => "support@lookinside-app.com" }
  s.source = { :git => "https://github.com/LookInsideApp/LookInside-Release.git", :tag => s.version.to_s }
  s.ios.deployment_target = "15.0"
  s.osx.deployment_target = "14.0"
  s.swift_versions = ["5.9"]
  s.vendored_frameworks = "LookInsideServer.xcframework"
  s.prepare_command = <<-CMD
set -eu
curl -L -o LookInsideServer.xcframework.zip "https://github.com/LookInsideApp/LookInside-Release/releases/download/1.0.2/LookInsideServer.xcframework.zip"
echo "c9a2646382ce6c9a949a04dc41b32457741083fd7fc3e2e64ff92b3c5b721ede  LookInsideServer.xcframework.zip" | shasum -a 256 -c -
rm -rf LookInsideServer.xcframework
ditto -x -k LookInsideServer.xcframework.zip .
rm LookInsideServer.xcframework.zip
  CMD
end
