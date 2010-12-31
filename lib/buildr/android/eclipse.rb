module Buildr
  module Android
    module Java
      include Extension
      NATURE    = 'org.eclipse.jdt.core.javanature'
      CONTAINER = 'org.eclipse.jdt.launching.JRE_CONTAINER'
      BUILDER    = 'org.eclipse.jdt.core.javabuilder'

      after_define do |project|
        eclipse = project.eclipse

        # smart defaults
        if project.compile.language == :java || project.test.compile.language == :java
          eclipse.natures = NATURE if eclipse.natures.empty?
          eclipse.classpath_containers = CONTAINER if eclipse.classpath_containers.empty?
          eclipse.builders = BUILDER if eclipse.builders.empty?
        end

        # :java nature explicitly set
        if eclipse.natures.include? :java
          eclipse.natures += [NATURE] unless eclipse.natures.include? NATURE
          eclipse.classpath_containers += [CONTAINER] unless eclipse.classpath_containers.include? CONTAINER
          eclipse.builders += [BUILDER] unless eclipse.builders.include? BUILDER
        end
      end

    end
  end
end

class Buildr::Project
  include Buildr::Android::Java
end