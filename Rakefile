require 'rubygems'
require 'rake'

begin
  require 'jeweler'
  Jeweler::Tasks.new do |gem|
    gem.name = "spackle"
    gem.summary = %Q{Spackle tells your editor about the errors in your code}
    gem.description = %Q{
Spackle tells your editor about the errors in your code. No more need to 
visually scan your test output for errors, filenames, and line numbers.
Just tell your editor to jump to the next error location.
		}
    gem.email = "rick@lee-morlang.com"
    gem.homepage = "http://github.com/rleemorlang/spackle"
    gem.authors = ["Rick Lee-Morlang"]
    gem.add_development_dependency "rspec", ">= 1.2.9"
    gem.add_dependency "project_scout"
    # gem is a Gem::Specification... see http://www.rubygems.org/read/chapter/20 for additional settings
  end
  Jeweler::GemcutterTasks.new
rescue LoadError
  puts "Jeweler (or a dependency) not available. Install it with: sudo gem install jeweler"
end

require 'spec/rake/spectask'
Spec::Rake::SpecTask.new(:spec) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.spec_files = FileList['spec/**/*_spec.rb']
end

Spec::Rake::SpecTask.new(:rcov) do |spec|
  spec.libs << 'lib' << 'spec'
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :spec => :check_dependencies

task :default => :spec

require 'rake/rdoctask'
Rake::RDocTask.new do |rdoc|
  version = File.exist?('VERSION') ? File.read('VERSION') : ""

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "spackle #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end
