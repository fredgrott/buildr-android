module Android
  include Buildr::Extension
  
  class << self
    def home
      ENV['ANDROID_HOME']
    end
  end
  
  class AndroidLayout < Layout
    def initialize
      super
      self[:source, :main, :java]              = 'src'
      self[:source, :main, :generated]         = 'gen'
      self[:source, :main, :resources]         = 'res'
      self[:source, :main, :assets]            = 'assets'
      
      # default test folder
      self[:source, :test]                     = 'tests'
      # unit test with robolectric
      self[:source, :test, :unit]              = 'java'
      # instrumentation project
      self[:source, :test, :instrumentation]   = 'instrumentation'
    end
  end
  
  class AndroidConfig
    
    def initialize(project)
      @project                                       = project
      #find version from manifest
      @version                                     = project.base_dir
    end
    
    def dependencies
      @dependencies                              ||= []
    end
    
    def unittest (project)
      @roboproject                                 = project
    end
    
    def instrumentation (project)
      @instrumentationproject                      = project
    end
  end
  
  attr_accessor :android_home, :android_version
  
  def android
    @android_config                              ||= AndroidConfig.new(self)
  end
  
  first_time do
    # Define task not specific to any projet.
    desc 'Unit test using robolectric'
    Project.local_task('testlocal')
  end
  
  before_define do |project|
    puts project.map(&:name)
    
    Rake::Task.define_task 'testlocal' do |task|
      puts "Project #{project.name} has 10 lines of code"
    end
  end
  
  after_define do |project|
  end
end

class JUnit
  alias_method :old_run, :run
  def run(tests, dependencies)
    # ensure android.jar is put last upon junit test runs - needed by robolectric
    old_run(tests, dependencies.sort_by {|w| (w.include? 'android') ? 1 : -1 })
  end
end

eclipse.natures ['com.android.ide.eclipse.adt.AndroidNature', 'org.eclipse.jdt.core.javanature']
eclipse.classpath_containers 'com.android.ide.eclipse.adt.ANDROID_FRAMEWORK'
eclipse.builders ['com.android.ide.eclipse.adt.ResourceManagerBuilder' ,'com.android.ide.eclipse.adt.PreCompilerBuilder',
  'org.eclipse.jdt.core.javabuilder' , 'com.android.ide.eclipse.adt.ApkBuilder']
  
  
  
class Buildr::Project
  include Android
end