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
    include Android
    
    puts version # will output from manifest
    eclipse :android
    
    compile.with :android
    test.with :robolectric
    
    package(:apk).tap do |apk|
      apk[:key] = "location"
      apk[:password] = "" # if none will ask in the shell
    end
    
  end
  TEXT

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'buildr', ">= 1.4.4"
end
