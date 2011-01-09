require File.expand_path(File.join(File.dirname(__FILE__), '../..', 'spec_helpers'))

describe Buildr::Robolectric do
  
  describe "Robolectric" do
    
    before do
      # ensure we are seen as android
      write 'AndroidManifest.xml'
    end

    it 'should have robolectric if layout folder contains unit test' do
      write 'java/HelloTest.java'
      define 'foo'
      project('foo').test.framework.should eql(:robolectric)
    end
    
    it 'should not have robolectric if layout does not point to robo folder' do
    end
    
    it 'should put robolectric in front of dependency list' do
    end
  end
end