require File.expand_path(File.join(File.dirname(__FILE__), '../..', 'spec_helpers'))

describe Buildr::Android do    
	describe 'Android project' do
    
    it "should set the correct layout if Android project" do
      
    end
    
    it "should fail if AndroidManifest is not at the root" do
    end
    
    it 'should get the version from android by default' do    
      write 'AndroidManifest.xml', <<-XML
        <?xml version="1.0" encoding="utf-8"?>
        <manifest xmlns:android="http://schemas.android.com/apk/res/android"
          android:versionCode="10"
          android:versionName="2.0.1" />
      XML
      define('foo').version.should eq("2.0.1")
    end
    
    it "should log if no minimum SDK is present" do
      write 'AndroidManifest.xml'
      lambda { define('foo') }.should show_warning(/no mimimum SDK set/)
    end
    
    it "should create" do
    end
    
  end
end