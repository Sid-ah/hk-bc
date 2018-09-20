# DB Drill: ActiveRecord Symmetric Migrations 

##Summary 

 While it's not *always* possible, in many cases we can write our migrations in such a way that we can travel through time using database migrations. You saw a little bit of this in a previous challenge, when we were using the `VERSION` argument to the `rake db:migrate` command.

In other words, migrations can go in two directions. That is, just like you can migrate a database forward, you should be able to migrate a database back to previous versions, as well, thereby undoing the schema changes and data changes (assuming no data was removed during the forward migration). Sometimes ActiveRecord is smart enough figure out how to do this on its own. [Other times, it isn't](http://guides.rubyonrails.org/migrations.html#using-the-up-down-methods).

By the end of this challenge, you'll be intimately familiar with how to write migrations in such a way that they are "symmetric".

Copy your code from the [ActiveRecord Student Schema](../../../db-drill-ar-student-schema-challenge) into the `ar_associations` directory in the source directory to work forward from that code. 


##Releases

###Release 0 : Internationalize the Schema

Those of you who are a bit more savvy in terms of [internationalization (i18n)](http://en.wikipedia.org/wiki/Internationalization_and_localization) probably noticed that our schema has a mistake in it. Specifically, we are capturing a `first_name` and `last_name` for each student. However, for various cultures around the world, [those fields don't make sense](http://www.w3.org/International/questions/qa-personal-names).

To fix it, you need to replace the `first_name` and `last_name` fields with a `name` field that will store the full name of the student. *Be sure not to lose any data!* When you write your migration, just concatenate the first and last names (with a space in between) into the new field.

To prove to yourself that there is no data loss, *before you run your migration*, you should clear out any data you have in your `students` table and then load [this test data file](https://raw.github.com/dbc-challenges/ar-student-schema/master/db/data/students.csv):

```bash
$ sqlite3 db/ar-students.sqlite3
SQLite version 3.7.12 2012-04-03 19:43:07
Enter ".help" for instructions
Enter SQL statements terminated with a ";"
sqlite> delete from students;
sqlite> .exit
$ rake db:populate
```

Be sure your migration is written in a symmetric way! In other words, if you run `rake db:migrate; rake db:migrate VERSION=<previous_version>`, the table and its data should look exactly as it did before running the command.

While you're at it, let's also add an `address` field for each student, which will store their full address.

#### Test Your Code

Before submitting this challenge, you must test your code by using the following command sequence:

```bash
$ PREV_VERSION=`rake db:version | colrm 1 17`
$ rake db:migrate
$ rspec spec/student_internationalized_spec.rb -e "Student internationalized"
$ rake db:migrate VERSION=$PREV_VERSION
$ rspec spec/student_internationalized_spec.rb -e "Student symmetric migration"
```

All tests should pass.
