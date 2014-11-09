require "bundler/gem_tasks"
#require "rake"

begin
  require 'rspec/core/rake_task'
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

desc "runs all examples"
task :default => :spec
