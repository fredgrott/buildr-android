require 'xmlsimple'

module Buildr
  module Android
    class Manifest
      
      attr_accessor :xml
    
      def initialize(project)        
        begin 
          @xml = XmlSimple.xml_in(project._("AndroidManifest.xml"))
        rescue Exception => e
          error "can't parse AndroidManifest.xml"
        end
      end
      
      def version
        @xml['android:versionName']
      end
      
      def min_sdk
        @xml['uses-sdk'][0]["android:minSdkVersion"] rescue warn "No min SDK is defined"
      end
      
    end
  end
end

