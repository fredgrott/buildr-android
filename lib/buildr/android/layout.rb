module Buildr
  module Android
    class Layout < Buildr::Layout
      def initialize
        super        
        self[:source, :main, :java]              = 'src'
        self[:source, :main, :generated]         = 'gen'
        self[:source, :main, :resources]         = 'res'
        self[:source, :main, :assets]            = 'assets'
        
        # default test folder
        self[:source, :test]                     = 'tests'
        # unit test with robolectric
        self[:source, :test, :unit]              = 'tests/java'
        # unit test with robolectric
        self[:source, :test, :java]       = 'tests/java'
        # instrumentation project
        self[:source, :test, :instrumentation]   = 'tests/instrumentation'
      end  
    end
  end
end