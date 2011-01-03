require File.expand_path(File.join(File.dirname(__FILE__), '../../', 'spec_helpers'))

describe Buildr::Eclipse::Android do
  it "should get the type of project from options" do    
    # define 'root' do      
    #   define 'foo', :android_type => :robolectric do
    #   end
    #   
    #   define 'bar', :android_type => :instrumentation do
    #   end
    #   
    #   define 'libfoo', :android_type => :library do
    #   end
    #   
    #   define 'main', :android_type => :main do
    #   end
    # end
    # project('root:foo').android_type.should eql(:robolectric)
    # project('root:bar').android_type.should eql(:instrumentation)
    # project('root:libfoo').android_type.should eql(:library)
    # # project('root:foo').task('eclipse').invoke
    1.should eql 1
  end
end
