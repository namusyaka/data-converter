require 'rspec/core/rake_task'

desc "Run all specs."
RSpec::Core::RakeTask.new(:rspec) do |spec|
  spec.pattern = 'test/*_spec.rb'
  spec.rspec_opts = %w(--format p --color)
end
task :default => :rspec

