require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "pistachio"
  gem.homepage = "http://github.com/tarcieri/pistachio"
  gem.license = "MIT"
  gem.summary = %Q{TODO: one-line summary of your gem}
  gem.description = %Q{TODO: longer description of your gem}
  gem.email = "tony@medioh.com"
  gem.authors = ["Tony Arcieri"]
  
  # Include your dependencies below. Runtime dependencies are required when using your gem,
  # and development dependencies are only needed for development (ie running rake tasks, tests, etc)
  gem.add_runtime_dependency "stash", ">= 1.0.0"
  gem.add_runtime_dependency "rack",  "~> 1.2.0"
  
  gem.add_development_dependency 'rspec', '>= 2.1.0'
end
Jeweler::RubygemsDotOrgTasks.new

require 'rake/testtask'

namespace :test do
  Rake::TestTask.new(:rack) do |test|
    test.libs << 'lib' << 'test'
    test.pattern = 'test/rack/**/test_*.rb'
    test.verbose = true
  end
end

task :default => 'test:rack'

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "pistachio #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
