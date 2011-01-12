require File.expand_path(File.join(File.dirname(__FILE__), '../..', 'spec_helpers'))

describe Buildr::Android do
  
  before do
    # ensure we are seen as android
    write 'AndroidManifest.xml'
  end
  
  describe "Layouts" do
    layout = Buildr::Android::Layout.new
    layout.expand(:source, :test, :unit).should == 'tests/java'
    layout.expand(:source, :test, :instrumentation).should == 'tests/instrumentation'
  end
  
end
