# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "buildr/android/version"

Gem::Specification.new do |s|
  s.name        = "buildr-android"
  s.version     = Buildr::Android::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Carl-Gustaf Harroch"]
  s.email       = ["carl@novoda.com"]
  s.homepage    = "http://github.com/novoda/buidlr-android"
  s.summary     = "Android buildr plugin"
  s.description = <<-TEXT
  Android plugin for buildr which adds eclipse functionnality and robolectric local test functionnality.
  To test:
  
  define 'android_project' do
    android :version => 1, :sdk_location => '/opt/android'
    eclipse :android
    compile.with :android
    test.with :robolectric
  end
  
  
  TEXT

  s.rubyforge_project = "buildr-android"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'rake',                 '0.8.7' if Gem.available?('rake')
  s.add_dependency 'builder',              '2.1.2' 
  s.add_dependency 'rjb',                  '1.3.3' if s.platform.to_s == 'ruby'
  s.add_dependency 'rjb',                  '1.3.2' if s.platform.to_s == 'x86-mswin32'
  s.add_dependency 'atoulme-Antwrap',      '0.7.1' if Gem.available?('atoulme-Antwrap')
  s.add_dependency 'xml-simple',           '1.0.12'
  s.add_development_dependency 'rspec',                '~> 2.1.0' if Gem.available?('rspec')
end
