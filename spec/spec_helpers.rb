require "rubygems"
require "bundler/setup"

unless defined?(SpecHelpers)
  module SandboxHook
    def SandboxHook.included(spec_helpers)
      spec = Gem::Specification.load(File.expand_path('../buildr-android.gemspec', File.dirname(__FILE__)))
      spec.dependencies.select {|dep| dep.type == :runtime }.each { |dep| gem dep.name, (dep.respond_to?(:requirement) ? dep.requirement.to_s : dep.version_requirements.to_s) }
      $LOAD_PATH.unshift File.expand_path('../lib', File.dirname(__FILE__))
      require 'buildr-android'
    end
  end
  require File.join(File.dirname(__FILE__), "/../buildr/spec/spec_helpers.rb")
end
