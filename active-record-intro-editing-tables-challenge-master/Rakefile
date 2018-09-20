require_relative "config/environment"
require 'rspec/core/rake_task'
require 'active_support/core_ext'




task :default => :spec

desc "Run the spec suite"
RSpec::Core::RakeTask.new(:spec)




desc 'Start IRB with application environment loaded'
task "console" do
  exec "irb -r ./config/environment"
end




namespace :db do
  desc "Create the database"
  task :create do
    puts "Creating development database and test databases, if they don't exist ..."
    touch "db/database.sqlite3"
    touch "db/test-database.sqlite3"
  end


  desc "Drop the database"
  task :drop do
    puts "Dropping development and test databases..."
    rm_f "db/database.sqlite3"
    rm_f "db/test-database.sqlite3"
  end


  desc "Migrate the database"
  task :migrate do
    # Run migrations for the test database in a separate thread
    test_thread = ENV['AR_ENV'] == 'test' ? nil : Thread.new { `bundle exec rake db:migrate AR_ENV=test` }

    # Ensure that we see the output when running migrations
    ActiveRecord::Migration.verbose = ENV["VERBOSE"] ? ENV["VERBOSE"] == "true" : true

    # Tell ActiveRecord where to find the migration files and run them
    migrations_directory = "#{APP_ROOT}db/migrate"
    ActiveRecord::Migrator.migrations_paths << migrations_directory
    ActiveRecord::Migrator.migrate ActiveRecord::Migrator.migrations_paths

    # Allow test thread to finish
    test_thread.join if test_thread
  end

  desc "rollback your migration--use STEP=number to step back multiple times"
  task :rollback do
    number_of_steps = (ENV['STEP'] || 1).to_i

    # Rollback the test database in a separate thread
    test_thread = ENV['AR_ENV'] == 'test' ? nil : Thread.new { `bundle exec rake db:rollback STEP=#{number_of_steps} AR_ENV=test` }

    ActiveRecord::Migrator.rollback('db/migrate', number_of_steps)

    # Run the db:version rake task
    Rake::Task['db:version'].invoke if Rake::Task['db:version']

    # Allow test thread to finish
    test_thread.join if test_thread
  end


  desc "populate the database with sample data"
  task :seed do
    require APP_ROOT.join('db', 'seeds.rb')
  end


  desc "Returns the current schema version number"
  task :version do
    puts "Current version: #{ActiveRecord::Migrator.current_version}"
  end
end




namespace :generate do
  desc "Create an empty model in app/models, e.g., rake generate:model NAME=User"
  task :model do
    unless ENV.has_key?('NAME')
      raise "Must specificy model name, e.g., rake generate:model NAME=User"
    end

    model_name     = ENV['NAME'].camelize
    model_filename = ENV['NAME'].underscore + '.rb'
    model_path = APP_ROOT.join('app', 'models', model_filename)

    if File.exist?(model_path)
      raise "ERROR: Model file '#{model_path}' already exists"
    end

    puts "Creating #{model_path}"
    File.open(model_path, 'w+') do |f|
      f.write(<<-EOF.strip_heredoc)
        class #{model_name} < ActiveRecord::Base
          # Remember to create a migration!
        end
      EOF
    end
  end

  desc "Create an empty migration in db/migrate, e.g., rake generate:migration NAME=create_tasks"
  task :migration do
    unless ENV.has_key?('NAME')
      raise "Must specificy migration name, e.g., rake generate:migration NAME=create_tasks"
    end

    name     = ENV['NAME'].camelize
    filename = "%s_%s.rb" % [Time.now.strftime('%Y%m%d%H%M%S'), ENV['NAME'].underscore]
    path     = APP_ROOT.join('db', 'migrate', filename)

    if File.exist?(path)
      raise "ERROR: File '#{path}' already exists"
    end

    puts "Creating #{path}"
    File.open(path, 'w+') do |f|
      f.write(<<-EOF.strip_heredoc)
        class #{name} < ActiveRecord::Migration
          def change
          end
        end
      EOF
    end
  end

  desc "Create an empty model spec in spec, e.g., rake generate:spec NAME=user"
  task :spec do
    unless ENV.has_key?('NAME')
      raise "Must specificy model name, e.g., rake generate:spec NAME=user"
    end

    name     = ENV['NAME'].camelize
    filename = "%s_spec.rb" % ENV['NAME'].underscore
    path     = APP_ROOT.join('spec', 'models', filename)

    if File.exist?(path)
      raise "ERROR: File '#{path}' already exists"
    end

    puts "Creating #{path}"
    File.open(path, 'w+') do |f|
      f.write(<<-EOF.strip_heredoc)
        require 'spec_helper'
        describe #{name} do
          pending "add some examples to (or delete) #{__FILE__}"
        end
      EOF
    end
  end
end
