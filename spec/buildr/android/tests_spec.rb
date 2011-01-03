require File.expand_path(File.join(File.dirname(__FILE__), '../..', 'spec_helpers'))

describe Buildr::Robolectric do
  
  it 'should be picked if the test language is Java' do
    @test = define 'foo' do
      test.compile.using(:javac)
      test.framework.should eql(:junit)
    end
  end
  
end