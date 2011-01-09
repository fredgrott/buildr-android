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
        # this is a android project
        if File.exists?(project._('AndroidManifest.xml'))
          begin
            @manifest = Buildr::Android::Manifest.new(project)
            warn(/no mimimum SDK set/) 
            project.version = @manifest.version
          rescue
          end
        end
      end
      
      after_define do |project|
      end
      
    end
  end
end
      
  
class Buildr::Project
  include Buildr::Android::ProjectExtension
end