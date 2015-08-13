begin
  require 'bundler/setup'
  require 'bundler/gem_tasks'
rescue LoadError
  puts 'You must `gem install bundler` and `bundle install` to run rake tasks'
end
require 'rspec/core/rake_task'
require 'rdoc/task'

Bundler::GemHelper.install_tasks

RDoc::Task.new(:rdoc) do |rdoc|
  rdoc.rdoc_dir = 'rdoc'
  rdoc.title    = 'Locuser'
  rdoc.options << '--line-numbers'
  rdoc.rdoc_files.include('README.rdoc')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

load 'rails/tasks/statistics.rake'

desc "Run all specs in spec directory (excluding plugin specs)"
RSpec::Core::RakeTask.new(:spec) do |task|
  task.rspec_opts = ['--color', '--format', 'documentation']
end
