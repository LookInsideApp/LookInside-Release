Pod::Spec.new do |s|
  s.name = "LookInsideServer"
  s.version = "0.2.4"
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
curl -L -o LookInsideServer.xcframework.zip "https://github.com/LookInsideApp/LookInside-Release/releases/download/0.2.4/LookInsideServer.xcframework.zip"
echo "9d569621a1015d2331f42aa1a433628333dfa3ea8773600e0e2c3de47af4614f  LookInsideServer.xcframework.zip" | shasum -a 256 -c -
rm -rf LookInsideServer.xcframework
ditto -x -k LookInsideServer.xcframework.zip .
rm LookInsideServer.xcframework.zip
  CMD
end
