unless defined?(SpecHelpers)
  module SandboxHook

    def SandboxHook.included(spec_helpers)
      # For testing we use the gem requirements specified on the buildr4osgi.gemspec
      spec = Gem::Specification.load(File.expand_path('../my.gemspec', File.dirname(__FILE__)))
      spec.dependencies.each { |dep| gem dep.name, dep.version_requirements.to_s }
      # Make sure to load from these paths first, we don't want to load any
      # code from Gem library.
      $LOAD_PATH.unshift File.expand_path('../lib', File.dirname(__FILE__))
      require 'mymodule'
    end
  end
  require File.join(File.dirname(__FILE__), "/../buildr/spec/spec_helpers.rb")

end
