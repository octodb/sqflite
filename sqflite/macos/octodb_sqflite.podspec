#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint octodb_sqflite.podspec' to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'octodb_sqflite'
  s.version          = '0.0.2'
  s.summary          = 'OctoDB & SQLite plugin'
  s.description      = <<-DESC
Access OctoDB & SQLite databases
                       DESC
  s.homepage         = 'https://github.com/octodb/sqflite'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Tekartik' => 'alex@tekartik.com' }
  s.source           = { :path => '.' }
  s.source_files     = 'Classes/**/*'
  s.dependency 'FlutterMacOS'
  s.dependency 'OctoFMDB'

  s.platform = :osx, '10.11'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES' }
  s.swift_version = '5.0'
end
