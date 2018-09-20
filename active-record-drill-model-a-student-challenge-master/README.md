# Active Record Drill: Model a Student

##Summary

| id | first_name | last_name | birthday | phone | created_at | updated_at |
| --- | --- | --- | --- | --- | --- | --- |
|1 | Hubert | Fried | 1980-04-20 | 419-531-8916 | 2015-03-27 12:00:00 | 2015-03-27 12:00:00 |
|2 | Nanny | Lamar | 1980-03-01 | 312-456-9827 | 2015-03-29 13:30:00 | 2015-03-30 17:45:00 |

*Figure 1*.  Depiction of a students table.

We're going to continue working with Active Record by modeling a student.  We'll build a `Student` class and back up the data for students in the students table of a database (see Figure 1). Working through this challenge will review and reinforce our understanding of Active Record: the relationship between the tables in our database and our Ruby classes, creating tables through Active Record migrations, and writing custom validation methods.  We'll also work with *virtual attributes*.

### Virtual Attributes
```ruby
hubert = Student.find(1)

hubert.first_name
# => "Hubert"

hubert.last_name
# => "Fried"

hubert.full_name
# => "Hubert Fried"
```
*Figure 2*. Exploring some of the attributes of a student object.

Active Record models derive their attributes from the tables that store their data.  In the case of the `Student` class we'll be working with, its attributes will come from the columns in the students table. However, sometimes it would be beneficial for our objects to have attributes that are not backed up by the database.  In the case of our students, in addition to having a first name and a last name, we might want them to have a full name (see Figure 2).  Or, as we can deduce from Figure 1, our students will have a birthday attribute, but we might also want them to have an age.

Virtual attributes differ from normal attributes in that their values are not persisted in the database. Rather, they are derived from other values in the database.  For example, getting a student's full name requires combining the first and last names.  Calculating the age requires some math using the student's birthday.  To access them, we write *getter methods*, such as `#full_name` or `#age`.

Setting virtual attributes can be less straight forward.  To do so, we write *setter methods*, such as `#full_name=`. What would a full name setter method do?  If we set a student's full name, would it make sense for the student's first and last names to be updated?  What would an `#age=` setter method do?  Would it be possible to derive someone's birthday from their age in years?

We'll explore working with virtual attributes as we work through this challenge.


##Releases

### Pre-release: Bundle and Create the Database
Before we begin working through the releases in this challenge, let's make sure that all the gems we'll be using have been installed and then create the database that we'll be working with.

1. Run Bundler to ensure that the proper gems have been installed.
2. Use the provided Rake task to create the database.


### Release 0: Create the Model and Migration Files
```text
$ bundle exec rake generate:model NAME=Student
$ bundle exec rake generate:migration NAME=create_students
```
*Figure 3*. Running rake tasks to create model and migration files.

The Rakefile for this challenge contains tasks for creating both model and migration files (see Figure 3 for example usage).  Generated model files will be placed in `app/models/`.  Generated migration files will be placed in `db/migrate/`.

Use the provided rake tasks to create a model file for our `Student` class and a migration for creating the students table.

Take a minute to look at the filenames of the files we've generated.  Compare the filenames to the classes defined within the files. What is the relationship between the filename and the class name? These and other naming conventions are important to ActiveRecord.


### Release 1: The Students Table
In *Release 0* we created an empty migration file for creating a students table in our database.  In this release, we're going to write and run the migration to create a students table.

We won't normally test our database's schema, but as we're still learning to write migrations, some tests have been provided to make sure that we do actually create a students table and that the table has the correct columns of the correct type.  For example, the table should have a string-type column named `first_name`.

1. Let's take a quick look at our student model.  We have some tests written for the `Student` class in `spec/models/student_spec.rb`.  Run the tests for the student model to see them fail. In particular, note the failing tests for the attributes.

2. Tests for the students table are provided in `spec/schema/students_table_spec.rb`.  Run the tests to see them fail.  The failing tests will describe the expected columns and their types.

3. Update the migration that we created in *Release 0* to create the students table ([migration overview][RailsGuides on Migrations]). Should we have any constraints on our table?  Columns that should not allow `null` values?  Columns that should be indexed?

4. Run the migration using the `db:migrate` Rake task.

5. Run the tests for the students table again.  If any of the tests fail, don't drop the database, rather take the opportunity to write a new migration to edit the table—remember to run the new migrations. Continue until all the tests in `spec/schema/students_table_spec.rb` pass.

6. Once our students table is created, let's return to our `Student` model.  Run the tests in `spec/models/student_spec.rb` again.  Look at the tests organized under *attributes*.  Before we created our students table, all of these attribute tests were failing.  Now that the students table has been created with the appropriate columns, the attribute tests pass.  Before moving on, be sure that you can explain why these attribute tests pass.


### Release 2: Virtual Attributes
In the *Summary* we discussed virtual attributes—specifically, students having a full name and an age.  Now let's add these behaviors to our `Student` model.  We'll need to write both *getter* and *setter* methods (e.g., `#full_name` and `#full_name=`).

```
$ bundle exec rspec --example "virtual attributes" spec/models/student_spec.rb
```
*Figure 4*. Running tests that have a specific description in a specific file.

Tests are provided in `spec/models/student_spec.rb`.  These particular tests are in an example group with the description `"virtual attributes"`.  We can use this description to run just these tests (see Figure 4).


### Release 3: Validations
In order to help protect the integrity of our database (i.e., keep bad data out of it), we're going to add some validations to our `Student` model.  We'll use a combination of the built-in [validation helpers][Validation Helpers] and [custom validation methods][Custom Validation Methods].

The validation tests are in an example group with the description `"validations"`.  Run these tests.  We'll see that some of the tests are passing and some are failing.  We haven't written any validations.  Why are some tests passing and others failing?  Right now, could any student be invalid?

Now it's time to actually add our validations.  Read through the validation specs to see what they expect, and then add the necessary validations to the `Student` model.  When we're done, all of the tests in the `"validations"` example group should pass.

Run all the tests for the `Student` class; they should all be passing.


## Conclusion
As we read in the *Summary*, this challenge was another opportunity for us to work with defining a model and backing up its data in a database.  Before tackling the next challenge, be sure to understand the relationship between database tables and Active Record models—specifically, the behaviors that the model derives from the table.

In addition, we should be comfortable working with ActiveRecord validations—both using the validation helpers and writing our own custom methods.  In Active Record how are objects marked as invalid?  How do custom validators mark objects as invalid?


[Custom Validation Methods]: http://guides.rubyonrails.org/v3.2.13/active_record_validations_callbacks.html#custom-methods
[Validation Helpers]: http://guides.rubyonrails.org/v3.2.13/active_record_validations_callbacks.html#validation-helpers
[RailsGuides on Migrations]: http://guides.rubyonrails.org/v3.2.13/migrations.html
