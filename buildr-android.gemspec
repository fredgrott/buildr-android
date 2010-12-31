# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "buildr/android/version"

Gem::Specification.new do |s|
  s.name        = "buildr-android"
  s.version     = Buildr::Android::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["Carl-Gustaf Harroch"]
  s.email       = [""]
  s.homepage    = ""
  s.summary     = %q{TODO: Write a gem summary}
  s.description = %q{TODO: Write a gem description}

  s.rubyforge_project = "buildr-android"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_dependency 'rspec',                '~> 2.1.0'
  s.add_dependency 'rake',                 '0.8.7'
  s.add_dependency 'builder',              '2.1.2'
  
  s.add_dependency 'net-ssh',              '2.0.23'
  s.add_dependency 'net-sftp',             '2.0.4'
  s.add_dependency 'rubyzip',              '0.9.4'
  s.add_dependency 'highline',             '1.5.1'
  s.add_dependency 'json_pure',            '1.4.3'
  s.add_dependency 'rubyforge',            '2.0.3'
  s.add_dependency 'hoe',                  '2.3.3'
  s.add_dependency 'rjb',                  '1.3.3' if s.platform.to_s == 'ruby'
  s.add_dependency 'rjb',                  '1.3.2' if s.platform.to_s == 'x86-mswin32'
  s.add_dependency 'atoulme-Antwrap',      '0.7.1'
  s.add_dependency 'rspec',                '~> 2.1.0'
  s.add_dependency 'xml-simple',           '1.0.12'
  s.add_dependency 'minitar',              '0.5.3'
  s.add_dependency 'jruby-openssl',        '>= 0.7' if s.platform.to_s == 'java'
  s.add_development_dependency 'jekyll', '~> 0.6.2' unless s.platform.to_s == 'java'
  s.add_development_dependency 'sdoc'
  s.add_development_dependency 'rcov', '0.9.9' unless s.platform.to_s == 'java'
  s.add_development_dependency 'win32console' if s.platform.to_s == 'x86-mswin32'
  s.add_development_dependency 'jekylltask', '>= 1.0.2' unless s.platform.to_s == 'java'
end
