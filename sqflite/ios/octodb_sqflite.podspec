#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html
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
  s.source_files = 'Classes/**/*'
  s.public_header_files = 'Classes/**/*.h'
  s.dependency 'Flutter'

  #s.dependency 'OctoFMDB', '>= 1.0.0'
  #s.dependency 'OctoFMDB', :git => 'https://github.com/octodb/fmdb'
  s.dependency 'OctoFMDB'

  s.platform = :ios, '9.0'
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'VALID_ARCHS[sdk=iphonesimulator*]' => 'x86_64' }
end
