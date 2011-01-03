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
  s.add_dependency 'builder',              '2.1.2'   
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rake'
  
  spec =s
  spec.add_development_dependency 'net-ssh',              '2.0.23'
  spec.add_development_dependency 'net-sftp',             '2.0.4'
  spec.add_development_dependency 'rubyzip',              '0.9.4'
  spec.add_development_dependency 'highline',             '1.5.1'
  spec.add_development_dependency 'json_pure',            '1.4.3'
  spec.add_development_dependency 'rubyforge',            '2.0.3'
  spec.add_development_dependency 'hoe',                  '2.3.3'
  spec.add_development_dependency 'rjb',                  '1.3.3' if spec.platform.to_s == 'ruby'
  spec.add_development_dependency 'rjb',                  '1.3.2' if spec.platform.to_s == 'x86-mswin32'
  spec.add_development_dependency 'atoulme-Antwrap',      '0.7.1'
  spec.add_development_dependency 'xml-simple',           '1.0.12'
  spec.add_development_dependency 'minitar',              '0.5.3'
  spec.add_development_dependency 'jruby-openssl',        '>= 0.7' if spec.platform.to_s == 'java'
  spec.add_development_dependency 'jekyll', '~> 0.6.2' unless spec.platform.to_s == 'java'
  spec.add_development_dependency 'sdoc'
  spec.add_development_dependency 'rcov', '0.9.9' unless spec.platform.to_s == 'java'
  spec.add_development_dependency 'win32console' if spec.platform.to_s == 'x86-mswin32'
  spec.add_development_dependency 'jekylltask', '>= 1.0.2' unless spec.platform.to_s == 'java'
end
