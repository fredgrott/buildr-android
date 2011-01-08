require 'rexml/document'

module Buildr
  module Android
    class Manifest
      include REXML
      
      attr_accessor :version 
    
      def initialize(project)
        if File.exists?(project._("AndroidManifest.xml"))
          @xml = Document.new(project._("AndroidManifest.xml"))
          @version = @xml.to_s
        end
      end
    end
  end
end
