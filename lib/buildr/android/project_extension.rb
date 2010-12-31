module Buildr
  module Android
    module ProjectExtension
      include Extension
      
      def android_type
        @android_type
      end
      
      def android_type=(type)
        @android_type = type
      end
      
      # def initialize
      #   super
      #   self[:source, :main, :java]              = 'src'
      #   self[:source, :main, :generated]         = 'gen'
      #   self[:source, :main, :resources]         = 'res'
      #   self[:source, :main, :assets]            = 'assets'
      #   
      #   # default test folder
      #   self[:source, :test]                     = 'tests'
      #   # unit test with robolectric
      #   self[:source, :test, :unit]              = 'java'
      #   # instrumentation project
      #   self[:source, :test, :instrumentation]   = 'instrumentation'
      # end
        
      first_time do
        sdk = %w{ ANDROID_HOME ANDROID_SDK }.inject(nil) {|r, v| r = ENV[v]}
        fail "Please set ANDROID_HOME to point to your ANDROID SDK installation" unless sdk
        @config ||= Buildr::Android::Config.new(self, sdk)
      end
      
      before_define do |project|
        puts 'before time'
      end
      
      after_define do |project|      
        puts 'before time'
      end
      
    end
  end
end

class Buildr::Project
  include Buildr::Android::ProjectExtension
end