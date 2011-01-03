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
        sdk = %w{ ANDROID_HOME }.inject(nil) {|r, v| r = ENV[v] }
        fail "Please set ANDROID_HOME to point to your ANDROID SDK installation" unless sdk
        @config ||= Buildr::Android::Config.new(self, sdk)
      end
      
      before_define do |project|
        puts 'before time' + project.to_s
         #puts 'robolectric project defined in ' + project.layout[:source, :test, :unit].to_s
        #if (File.exists? project.layout[:source, :test, :unit]) 
          
          puts 'robolectric project defined in ' + project.layout[:source, :test, :unit].to_s
          @robo = Project.define(project.name + ":robolectric", nil)
          # @robo.parent = self
          # ROBOLECTRIC_VERSION = '0.9.4'
          # ROBOLECTRIC = "robolectric:robolectric:jar:#{ROBOLECTRIC_VERSION}"
          # url = "http://pivotal.github.com/robolectric/downloads/robolectric-#{ROBOLECTRIC_VERSION}-all.jar"
          # download(artifact(ROBOLECTRIC) => url)
          # @robo.test.with ROBOLECTRIC
          #  end
      end
      
      after_define do |project|
        puts 'after time'
        
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