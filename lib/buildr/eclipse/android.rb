module Buildr
  module Eclipse
    module Android
      include Extension
      
      NATURE    = 'com.android.ide.eclipse.adt.AndroidNature'
      CONTAINER = 'com.android.ide.eclipse.adt.ANDROID_FRAMEWORK'
      BUILDER    = ['com.android.ide.eclipse.adt.ResourceManagerBuilder' ,'com.android.ide.eclipse.adt.PreCompilerBuilder',
        'org.eclipse.jdt.core.javabuilder' , 'com.android.ide.eclipse.adt.ApkBuilder']
        
        
        after_define :eclipse => :eclipse_android
        after_define :eclipse_android do |project|
          
          eclipse = project.eclipse
          eclipse.exclude_libs += project.test.dependencies
          
          # smart defaults
          if eclipse.natures.empty? && (File.exists?(project.path_to("AndroidManifest.xml")))
            eclipse.natures = [NATURE, Buildr::Eclipse::Java::NATURE]
            eclipse.classpath_containers = [CONTAINER] if eclipse.classpath_containers.empty?
            eclipse.builders = BUILDER if eclipse.builders.empty?
          end
          
          # :android nature explicitly set
          if eclipse.natures.include? :android
            eclipse.natures = [NATURE, Buildr::Eclipse::Java::NATURE]
            eclipse.classpath_containers = [CONTAINER] if eclipse.classpath_containers.empty?
            eclipse.builders = BUILDER if eclipse.builders.empty?
          end
      end
      
    end
  end
end
    
class Buildr::Project
  include Buildr::Eclipse::Android
end
