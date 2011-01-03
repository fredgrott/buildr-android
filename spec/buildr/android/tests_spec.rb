require File.expand_path(File.join(File.dirname(__FILE__), '../../', 'spec_helpers'))


describe Buildr::Robolectric do
  
  it 'should be the default test framework when run with robolectric runner' do
    write 'src/test/java/com/exampe/FirstTest.java', <<-JAVA
      package com.example;
      @RunWith(RobolectricTestRunner.class)
      public class FirstTest { }
    JAVA
    define 'foo'
    #project('foo').test.framework.should eql(:robolectric)
  end
  
end