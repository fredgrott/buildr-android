module Buildr
  class Robolectric < TestFramework::Java
  end
  
  class Instrumentation < TestFramework::Java
  end    
end #Buildr

Buildr::TestFramework << Buildr::Robolectric
Buildr::TestFramework << Buildr::Instrumentation