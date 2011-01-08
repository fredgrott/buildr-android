module Buildr
  module Android
    module ProjectExtension
      include Extension
      include FileTest
      
      attr_accessor :manifest
      
      first_time do
        @sdk = %w{ ANDROID_HOME }.inject(nil) {|r, v| r = ENV[v] }
        fail "Please set ANDROID_HOME to point to your ANDROID SDK installation" unless @sdk
        @config ||= Buildr::Android::Config.new(self, @sdk)
      end
      
      before_define do |project|
        @manifest = Buildr::Android::Manifest.new(project) if File.exists?(project._('AndroidManifest.xml'))
        project.version = @manifest.version
      end
      
      after_define do |project|
      end
      
    end
  end
end
      
  
class Buildr::Project
  include Buildr::Android::ProjectExtension
end