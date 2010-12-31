module Buildr
  module Android
    class Config
      attr_writer :manifest

      attr_reader :project, :android_path

      def initialize(project, android_path)
        @project= project
        @android_path = android_path
      end

      def manifest
        return @manifest unless @manifest.nil?
        filename = project.base_dir + "AndroidManifest.xml"
        File.exist?(filename) ? filename : nil
      end
      
      def min_sdk
      end

    end
  end
end