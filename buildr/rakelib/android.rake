begin
  desc "Run all android specs"
  RSpec::Core::RakeTask.new 'spec:android' do |task|
    task.rspec_files = FileList['spec/**/*_spec.rb']
    task.rspec_opts = default_spec_opts
    task.rspec_opts << '--format documentation'
  end
  file('_reports/specs.html') { task(:spec).invoke }
end