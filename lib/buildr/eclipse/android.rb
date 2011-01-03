# Licensed to the Apache Software Foundation (ASF) under one or more
# contributor license agreements.  See the NOTICE file distributed with this
# work for additional information regarding copyright ownership.  The ASF
# licenses this file to you under the Apache License, Version 2.0 (the
# "License"); you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#    http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS, WITHOUT
# WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.  See the
# License for the specific language governing permissions and limitations under
# the License.


require 'buildr/core/project'
require 'buildr/core/common'

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