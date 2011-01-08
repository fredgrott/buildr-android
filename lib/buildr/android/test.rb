module Buildr  
  class Robolectric < Junit
    
    # Robolectric version number.
    VERSION = '0.9.4'

    class << self
      def dependencies        
        @dependencies ||= ["com.pivotallabs:robolectric:jar:#{version}"]
      end
    end
    
    def run(tests, dependencies)
      # ensure android.jar is put last upon junit test runs - needed by robolectric
      super.run(tests, dependencies.sort_by {|w| (w.include? 'android') ? 1 : -1 })
    end
    
    task('clean') { }
  end
  
  class Instrumentation < TestFramework::Java
  end    
end #Buildr

Buildr::TestFramework << Buildr::Robolectric
Buildr::TestFramework << Buildr::Instrumentation