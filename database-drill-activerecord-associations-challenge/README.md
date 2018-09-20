# Database Drill ActiveRecord Associations 
 
##Learning Competencies 

* Use Active Record Migrations to create a database
* Use Active Record Queries to query a database
* Use Active Record to create Associations between database tables

##Summary 

Now that you're familiar with the basics of ActiveRecord migrations and simple ActiveRecord models, it's time to learn about [ActiveRecord Associations](http://guides.rubyonrails.org/association_basics.html).

You probably remember how to associate tables in a database using foreign keys. This challenge will build on that knowledge and extend it into the realm of the ActiveRecord ORM.

Copy your code from the [ActiveRecord Student Schema](../../../active-record-drill-model-a-student-challenge) into the `ar_associations` directory in the source directory to work forward from that code. 

##Releases

###Release 0 : Add a Teacher Model


Create a `Teacher` model that extends `ActiveRecord::Base`. It should have attributes to store the teacher's name, email address, and phone number. Remember to keep things [i18n](http://en.wikipedia.org/wiki/Internationalization_and_localization)-[friendly](http://www.w3.org/International/questions/qa-personal-names)!

This model should be created in its own Ruby file and in the right folder. You'll also need to create a migration to make sure the table gets created.

Use sqlite to verify the table has been created.

###Release 1 : Create some test data for Teachers

Without resorting to using SQL or SQLite, write some Ruby code that uses ActiveRecord commands to create some test data. Create 9 teachers, each with unique names and email addresses.

While you're at it, please ensure that no 2 teachers can share the same email address using an ActiveRecord validation. Write a test to be sure that it works.

#### Create a One-to-Many association between Teachers and Students

Let's assume for the time being that each student has only 1 teacher, and each teacher can have many students. Does your Teacher model need to change? How about your student model? Do you need a migration?

Make the necessary changes to your code to support this new constraint on the data.

Once you've done that, write some code that will arbitrarily distribute the students fairly evenly across the teachers.
  
Write tests to ensure that your association is working correctly. For example, given a student, can you find a teacher? Can you find all of her students?

###Release 2 : Uh-oh! The requirements have changed

The customer for whom you're building this system just changed her mind. It turns out that the system needs to support the notion that a student can have more than one teacher.

Make the necessary changes to your models (along with any necessary migrations) to support this.
 
Write tests to ensure that your association is working correctly. For example, given a student, can you find her teachers? Can you find all students for a given teacher?

###Release 3 : DRY it up!  (Optional)

Does it annoy you that both tables (`students` and `teachers`) are storing `name`, `email`, and `phone` fields? That's good!

Can you think of a way to fix it? Go ahead and do it!  Here's a start:

```ruby
class Person < ActiveRecord::Base
end

class Student < Person
  has_many :student_teachers, :foreign_key => :student_id
  has_many :teachers, :through => :student_teachers
end

class Teacher < Person
  # What relations go here?
end

class StudentTeacher < ActiveRecord::Base
  belongs_to :student
  belongs_to :teacher
end
```

[Only read this link if you need a hint](http://api.rubyonrails.org/classes/ActiveRecord/Base.html#label-Single+table+inheritance). 


<!-- ##Optimize Your Learning  -->

##Resources

* [ActiveRecord Associations](http://guides.rubyonrails.org/association_basics.html)
