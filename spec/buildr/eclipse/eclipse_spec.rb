require File.expand_path(File.join(File.dirname(__FILE__), '../../', 'spec_helpers'))

ANDROID_NATURE    = Buildr::Eclipse::Android::NATURE

module EclipseHelper
  def classpath_xml_elements
    task('eclipse').invoke
    File.open('.classpath') { |f| REXML::Document.new(f).root.elements }
  end

  def classpath_sources(attribute='path')
    classpath_xml_elements.collect("classpathentry[@kind='src']") { |n| n.attributes[attribute] }
  end

  # <classpathentry path="PATH" output="RETURNED_VALUE"/>
  def classpath_specific_output(path)
    specific_output = classpath_xml_elements.collect("classpathentry[@path='#{path}']") { |n| n.attributes['output'] }
    raise "expected: one output attribute for path '#{path}, got: #{specific_output.inspect}" if specific_output.length > 1
    specific_output[0]
  end

  # <classpathentry path="RETURNED_VALUE" kind="output"/>
  def classpath_default_output
    default_output = classpath_xml_elements.collect("classpathentry[@kind='output']") { |n| n.attributes['path'] }
    raise "expected: one path attribute for kind='output', got: #{default_output.inspect}" if default_output.length > 1
    default_output[0]
  end

  # <classpathentry path="PATH" sourcepath="RETURNED_VALUE" kind="var"/>
  def sourcepath_for_path(path)
    classpath_xml_elements.collect("classpathentry[@kind='var',@path='#{path}']") do |n|
      n.attributes['sourcepath'] || 'no source artifact'
    end
  end

  # <classpathentry path="PATH" javadocpath="RETURNED_VALUE" kind="var"/>
  def javadocpath_for_path(path)
    classpath_xml_elements.collect("classpathentry[@kind='var',@path='#{path}']") do |n|
      n.attributes['javadocpath'] || 'no javadoc artifact'
    end
  end

  def project_xml_elements
    task('eclipse').invoke
    File.open('.project') { |f| REXML::Document.new(f).root.elements }
  end

  def project_natures
    project_xml_elements.collect("natures/nature") { |n| n.text }
  end

  def build_commands
    project_xml_elements.collect("buildSpec/buildCommand/name") { |n| n.text }
  end

  def classpath_containers(attribute='path')
    classpath_xml_elements.collect("classpathentry[@kind='con']") { |n| n.attributes[attribute] }
  end
end

describe Buildr::Eclipse::Android do
  include EclipseHelper
  
  describe "eclipse's .project file for android" do
    
    describe 'Android project' do

      before do
        write 'buildfile'
        write 'src/main/java/Activator.java'
        write 'AndroidManifest.xml'
      end

      it 'should have plugin nature before Java nature' do
        @e = define('ae') { eclipse.natures :android }
        task('eclipse').invoke
        File.should be_exist(@e._('.project'))
        project_natures.should include(ANDROID_NATURE)        
      end
    end
  end  
end
