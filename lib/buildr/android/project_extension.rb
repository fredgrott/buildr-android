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
      
      def package_signed(keypath)
      end
      
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
        
        case project.android_type
        when :robolectric
          puts 'robolectric'
          
        when :instrumentation
          puts 'instrumentation'
          
        when :main
          else
            puts 'normal android project'
          end
        end
        
      end
    end
  end
    
  class JUnit
    alias_method :old_run, :run
    def run(tests, dependencies)
      # ensure android.jar is put last upon junit test runs - needed by robolectric
      old_run(tests, dependencies.sort_by {|w| (w.include? 'android') ? 1 : -1 })
    end
  end
  
  class Buildr::Project
    include Buildr::Android::ProjectExtension
  end