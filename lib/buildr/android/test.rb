module Buildr  
  class Robolectric < JUnit
    
    # Robolectric version number.
    VERSION = '0.9.5'

    class << self
      
      def applies_to?(project) #:nodoc:
        [project._("AndroidManifest.xml"), project._(:source, :test, :unit)].inject(true) {|o,v| o && File.exists?(v)}      
        true
      end
      
      def dependencies        
        @dependencies ||= ["com.pivotallabs:robolectric:jar:#{VERSION}"]
      end
    end
    
    def run(tests, dependencies)
      # ensure android.jar is put last upon junit test runs - needed by robolectric
      super.run(tests, dependencies.sort_by {|w| (w.include? 'android') ? 1 : -1 })
    end
    
    task('clean') { _(:source, :test, :java) }
  end
  
  class Instrumentation < TestFramework::Java
  end    
end #Buildr

Buildr::TestFramework << Buildr::Robolectric
Buildr::TestFramework << Buildr::Instrumentation