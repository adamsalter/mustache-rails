require 'rake'
require 'spec/rake/spectask'
require 'rake/rdoctask'

task :default => :spec

desc 'Run all specs'
Spec::Rake::SpecTask.new(:spec) do |t|
  t.spec_files = FileList['spec/**/*_spec.rb']
  t.spec_opts << '--color'
end
