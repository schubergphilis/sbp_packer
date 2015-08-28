require 'rubocop/rake_task'
require 'foodcritic'

desc 'RuboCop compliancy checks'
RuboCop::RakeTask.new(:rubocop)

FoodCritic::Rake::LintTask.new

desc 'Run all linters on the codebase'
task :linters do
  Rake::Task['foodcritic'].invoke
  Rake::Task['rubocop'].invoke
end

task default: [:foodcritic, :rubocop]

begin
  require 'kitchen/rake_tasks'
  Kitchen::RakeTasks.new
rescue LoadError
  puts '>>>>> Kitchen gem not loaded, omitting tasks' unless ENV['CI']
end
