require File.expand_path(File.join(File.dirname(__FILE__), '../..', 'spec_helpers'))

describe Buildr::Android do
  
  it "should fail if AndroidManifest is not at the root" do
  end
  
  it 'should get the version from android by default' do
    write 'AndroidManifest.xml', <<-XML
      <?xml version="1.0" encoding="utf-8"?>
      <manifest xmlns:android="http://schemas.android.com/apk/res/android"
        android:versionCode="10"
        android:versionName="2.0.1" />
    XML
    
    File.should be_exist('AndroidManifest.xml')
    define('foo').version.should eq "2.0.1"
  end
end