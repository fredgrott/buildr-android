begin
  require 'rspec/core/rake_task'
  directory '_reports'
  
  def default_spec_opts
    default = %w{--format failing_examples:failed --format html:_reports/specs.html --backtrace}
    default << '--colour' if $stdout.isatty && !(Config::CONFIG['host_os'] =~ /mswin|win32|dos/i)
    default
  end
  
  # RSpec doesn't support file exclusion, so hack our own.
  class RSpec::Core::RakeTask
    attr_accessor :rspec_files
  private
    def files_to_run
      @rspec_files
    end
  end
  
  desc "Run all android specs"
  RSpec::Core::RakeTask.new 'spec:android' do |task|
    task.rspec_files = FileList['spec/**/*_spec.rb']
    task.rspec_opts = default_spec_opts
    task.rspec_opts << '--format documentation'
  end
  file('_reports/specs.html') { task(:spec).invoke }
end
