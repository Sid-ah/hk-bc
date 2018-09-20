require 'faker'

task :console do
  exec "irb -r./app.rb"
end

namespace :db do
  task :seed do
    require_relative 'app'
    cohort_names = %w(Alpha Beta Delta Gamma Epsilon Zeta Eta Theta Iota)

    cohort_ids = cohort_names.map do |name|
      Cohort.create(:name => name)[:id]
    end

    2000.times do
      Student.create :first_name => Faker::Name.first_name,
                     :last_name  => Faker::Name.last_name,
                     :email      => Faker::Internet.email,
                     :birthdate  => Date.today - rand(15..40)*365,
                     :gender     => ['m', 'f'].sample,
                     :cohort_id  => cohort_ids.sample
    end
  end

  task :setup do
    require_relative 'app.rb'

    print "Creating database at #{Database::Model.filename}..."

    Database::Model.execute(<<-SQL)
      CREATE TABLE "students" (
        "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        "cohort_id" integer,
        "first_name" varchar(255),
        "last_name" varchar(255),
        "email" varchar(255),
        "gender" varchar(255),
        "birthdate" date,
        "created_at" datetime NOT NULL,
        "updated_at" datetime NOT NULL
      );
    SQL

    Database::Model.execute(<<-SQL)
      CREATE TABLE "cohorts" (
        "id" INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
        "name" varchar(255),
        "created_at" datetime NOT NULL,
        "updated_at" datetime NOT NULL
      );
    SQL

    puts "done"
  end

  desc "rollback your migration--use STEPS=number to step back multiple times"
  task :rollback do
    steps = (ENV['STEPS'] || 1).to_i
    ActiveRecord::Migrator.rollback('db/migrate', steps)
    Rake::Task['db:version'].invoke if Rake::Task['db:version']
  end
end
