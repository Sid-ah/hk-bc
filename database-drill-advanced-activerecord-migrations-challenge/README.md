# Database Drill Advanced Activerecord Migrations 
 
##Learning Competencies 

##Summary 

 In this challenge, you'll learn how to use [ActiveRecord migrations](http://guides.rubyonrails.org/migrations.html) to do more than just creating and dropping tables. Specifically, we'll learn how to add and remove columns, as well as more advanced things like merging two columns into one.

We're going to build on top of the last challenge, [ActiveRecord Student Schema](http://socrates.devbootcamp.com/challenges/150) for this challenge. Please be sure that both you and (if you are pairing) your pair are happy with your solutions for that challenge, and decide whose solution you want to use as a starting point.

Using `git`, commit early and commit *often*. You should be able to point a reviewer at a `git` SHA to show them any completed objective.

#### Before You Begin

1. Decide whose [ActiveRecord Student Schema](http://socrates.devbootcamp.com/challenges/150) codebase will be used as a starting point.
2. Use `git` to clone that student's repository to your workstation (if it doesn't exist there already).

## Objectives
### Add Timestamps for Created and Updated

Often (read: almost always) it can be useful to track when some data was first written to a database, as well as when it was last updated. For this objective, create a new migration that will add created_at and updated_at timestamp columns to your students table.

It's worth noting that all migration files in ruby should be stored in the `db/migrate` folder and should be named with a particular filename format, specifically: `YYYYMMDDHHMMSS_<migration_name>.rb`.

#### Test Your Code

Before submitting this challenge, you must test your code by using the following command:

```bash
$ rspec spec/migrate_timestamps_spec.rb
```

All tests should pass.

**NOTE:** When using Rails, all you would need to do to create this migration file would be to run `rails generate migration`.  Further data could be included by adding `rails generate migration Students created_at:datetime`.  Keep in mind what this magic is doing!  This challenge forces you to recognize the significance of the naming of the migration file as well as it's syntax.

### Understanding the Power of Migrations

Now that you've got a few different migrations in place, familiarize yourself with the following `rake` tasks: `db:migrate`, `db:version`.

Look into the arguments that the `db:migrate` task accepts. Of particular interest is the `VERSION` argument.

The power of ActiveRecord migrations lies in the fact that (if you code things right) you can move backward and forward in time with respect to your database schema.

Please note that not every rake task outlined in [this document](http://guides.rubyonrails.org/migrations.html#using-the-change-method) is supported by the `Rakefile` for this project. For now, just limit your tinkering to the `VERSION` argument to `db:migrate`.

Make sure you can migrate your database backwards and forward in time using the `VERSION` argument by using the following commands:

```bash
$ FIRST_MIGRATION=`ls db/migrate/*.rb | head -1`
$ FIRST_VERSION=`basename $FIRST_MIGRATION | sed "s/_.*$//g"`
$ rake db:migrate VERSION=$FIRST_VERSION
$ rspec spec/migrate_create_table_spec.rb
$ rake db:migrate
$ rspec spec/migrate_timestamps_spec.rb
```

All tests should pass.
 

##Releases
###Release 0 

##Optimize Your Learning 

##Resources