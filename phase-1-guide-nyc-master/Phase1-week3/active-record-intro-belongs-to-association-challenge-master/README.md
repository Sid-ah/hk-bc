# Active Record Intro:  Belongs To

## Summary

![Database Schema](schema_design_new.png)

*Figure 1*.  Schema design for this challenge, showing connections between primary keys and foreign keys.

As we've been working with schemas, we've begun to identify and design relationships in our databases—relationships like *one-to-many* and *many-to-many*.  We're going to begin to talk about these relationships in terms of our models, using the language of Active Record.  In Active Record, we often refer to these relationships as *associations*.

In this challenge, we'll be focusing exclusively on the *belongs to* association; this is one side of a one-to-many.  In a belongs to association, we'd say that one object belongs to another object.  For example, a dog belongs to an owner.

We know from our work with SQL that rows of data in one table can be paired with rows of data in another table (e.g., when joining tables).  We often make these connections by matching the primary key in one table with a foreign key in another table (see Figure 1).

If we had a dog with a known id, say 1, how could we find the name of its owner?  We have to get data from the people table, but we only have information about data in the dogs table.

```sql
SELECT people.first_name, people.last_name
FROM people
JOIN dogs
ON dogs.owner_id = people.id
WHERE dogs.id = 1;
```
*Figure 2*.  SQL query to retrieve the name of the owner of the dog with id 1.

We could check our database for the dog with id 1 and get the owner id value—the owner id is a foreign key field.  Say the owner id is 5.  We can take that value and go find the record in the people table with id 5.  This record would contain data for the dog's owner.  Then we could get the first and last names.  In principle this is what we're doing in the query in Figure 2.

When we define Active Record associations for our models, Active Record will be doing all of this SQL work for us.  But, as we'll see when we discuss Active Record conventions, it's important to know what's going on in the background.


### Identifying a Belongs To Association
A belongs to association is possible when we can connect the foreign key in one table to the primary key in another table.  The model with the foreign key and the model with the primary key can be associated with each other, but the type of association we need to declare depends on which key is with which model.

In this challenge, we're exploring the belongs to association.  Based on our schema, we could say that ...

- a dog belongs to an owner/person
- a rating belongs to the judge/person who did the rating
- a rating belongs to the dog that was rated

With these three belongs to associations in mind, let's look again at the schema in Figure 1.  Given the two models between which each of these associations are made (e.g., rating and dog), can we deduce on which table the foreign key resides?  Is the foreign key with the model that belongs to another model, or the other way around?

We've said that a rating belongs to the dog that was rated.  In connecting the ratings table to the dogs table, we match a foreign key on the ratings table, dog id, with the dogs table's primary key, id.  The ratings table contains the foreign key.  And this is how we identify that we would define a belongs to association for the `Rating` class.

If a model's database table has a foreign key that points to another model, it belongs to the other model.


### Declaring a Belongs To Association
```ruby
class Rating < ActiveRecord::Base
  belongs_to :dog
end
```

*Figure 3.*  Code for the class `Rating` with a belongs to association defined.

We've discussed how to identify where a belongs to association can be declared.  Now we'll talk about how to actually make the declaration (i.e., what is the syntax for declaring a belongs to association).

Figure 3 shows a `Rating` class that defines a belongs to association between `Rating` and `Dog`.  Note the line `belongs_to :dog`.  What is `belongs_to`?  What is `:dog`?

`.belongs_to` is a method.  It is very similar to the methods `.attr_reader`, `.attr_writer`, and `.attr_accessor` that we've been using in our ruby classes.  Like these methods, `.belongs_to` is a method that will be called on the class we're defining—in this case the class `Rating`.  These types of methods are sometimes referred to as *class-level declarations* or *macros*.

```ruby
rating = Rating.first
# => #<Rating id: 1, ... dog_id: 1, ... >
rating.dog
# => #<Dog id: 1, name: "Tenley", ... >
```
*Figure 4*.  Getting the dog to which a rating belongs.

Do we remember what the attribute methods do (e.g., `attr_reader`)?  They are a shorthand way of declaring *getter* and *setter* methods for instance variables.  In the same way, `.belongs_to` is going to provide us with methods that facilitate interacting with an object's associated object.  In this specific case, a `Rating` object will have methods for interacting with its `Dog` object (see Figure 4).  (For a look at how these class macros work, see [video from Pragmatic Studio](https://pragmaticstudio.com/blog/2015/4/14/ruby-macros).)



In this challenge we're going to explore the methods that `.belongs_to` generates.  It's important to note that the method names are derived from the first argument passed to the `.belongs_to` method.  In this case, we passed `:dog`.  For a belongs_to association, this must be singular.

What methods will we get?  We'll have both getter and setter methods for the `Dog` object; use of the getter method is demonstrated in Figure 4.  The getter method is `#dog` and the setter method is `#dog=`.

In addition to the getter and setter methods, there a few more methods that are provided when we declare that a rating belongs to a dog:  `#build_dog`, `#create_dog`, and `#create_dog!`.  We can use these methods to make new `Dog` objects to which ratings should belong—again we'll take a look at these later in this challenge.


### Active Record Conventions
Convention over configuration.  Active Record provides a lot of functionality with very little code.  In order to achieve this, we need to follow its conventions.  For example, our table names should match our class names; otherwise, Active Record doesn't work out of the box, and we have to configure it.

The same is true for defining associations between models.  When we declare a belongs to association for a class, there are conventions regarding the name of the class to which the class belongs and the name of the foreign key field:

- Active Record expects to find a class with a name matching the first argument passed to `.belongs_to`.  In Figure 3, we passed `:dog`, so Active Record expects to find a `Dog` class.

- Active Record expects to find a foreign key field with a name matching the first argument passed to `.belongs_to`.  In Figure 3, we passed `:dog`, so Active Record expects to find a foreign key field `dog_id` on the ratings table.

In this particular case, both of these conventions are followed, so our association works.  If one or both of these conventions were broken, we would have to configure the association.  In other words, we'd have to tell Active Record which class and/or foreign key field to use.

```ruby
class Rating
  belongs_to :dog, { :class_name => "Dog", :foreign_key => :dog_id }
end
```
*Figure 5*.  Passing an options hash when declaring a belongs to association.

We can configure an association by passing an optional argument to the `.belongs_to` method: an options hash.  Within the options hash, we can specify key-value pairs that configure the class name and the foreign key field to use.  In Figure 5, we're declaring a belongs to association and passing in an options hash to configure the association—though in this case, the options hash is unnecessary because convention was not broken.

If we look back at Figure 1, we can see that the ratings table holds another foreign key:  `judge_id`.  But, we don't have a judge model; we have a person model.  If we wanted to declare that a rating belongs to a judge (i.e., `belongs_to :judge`), we'd break convention.  Active Record would expect that a `Judge` class exists, but it does not.  So, we would need to specify to which class we're referring.  Active Record will also expect to find a `judge_id` foreign key field on the ratings table, which it does find, so we've not broken that convention and would not need to configure the foreign key field to use.


## Releases
### Pre-release: Setup
```
$ bundle install
$ bundle exec rake db:create
$ bundle exec rake db:migrate
$ bundle exec rake db:seed
```
*Figure 6*.  Setting up and seeding the database.

Before we begin, we need to create, migrate, and seed our database.  We'll seed our database with records for all three models:  `Dog`, `Rating`, and `Person`.  All the files necessary for this are provided:  the migrations and the seeds file.  We simply need to run the Rake tasks (see Figure 6).

We're going to work with our `Rating` class from within the Rake console.  Let's begin by opening the console.  Once it's open, we can begin interacting with our models.  As we work through each release, we should execute the provided example code ourselves and look at the return values.


### Release 0: Getting the Dog to Which a Rating Belongs
```ruby
rating = Rating.first
# => #<Rating id: 1, coolness: 6, ... >
rating.dog
# => #<Dog id: 1, name: "Tenley", ... >
```
*Figure 7*. Getting the dog to which a rating belongs.

We're going to explore the methods generated when we declare a belongs to association, and we'll start with the getter method.  When we declare that a rating belongs to a dog, we're provided with a method to get the dog.  Given an instance of the `Rating` class, we can ask the rating for the dog to which it belongs.

In Figure 7, we call `Rating.first` to get an instance of the `Rating` class.  We assign this instance of `Rating` to the variable `rating`.  We then call the `#dog` getter method provided to us by the `.belongs_to` method.  Through this method, we're able to retrieve the `Dog` object to which an instance of `Rating` belongs.  In this case, `#dog` returns the dog named Tenley.


### Release 1: Setting the Dog to Which a Rating Belongs
```ruby
rating.dog
# => #<Dog id: 1, name: "Tenley", ... >
jayda = Dog.find(2)
# => #<Dog id: 2, name: "Jayda", ... >
rating.dog = jayda
# => #<Dog id: 2, name: "Jayda", ... >
rating.save
# true
rating.dog
# => #<Dog id: 2, name: "Jayda", ... >
```
*Figure 8*. Setting the dog to which a rating belongs.

We'll continue working with the rating object from the previous release.  In this release, we'll discuss the setter method `#dog=`.  This setter method allows us a quick way to say that a rating belongs to a particular dog.  And, Active Record will take care of setting the rating's dog id foreign key value for us.

In Figure 8, we see that our rating object belongs to the dog named Tenley, as was seen in the previous release.  Then, we're assigning a new variable, `jayda`, to an instance of the `Dog` class, the dog with the id 2.  Next, we call the setter method `#dog=` to change the dog to which the rating belongs.  Our rating will no longer be associated with Tenley; it will be associated with Jayda.

*Note:* When we call the setter method, `#dog=`, the dog id attribute of the rating is updated in the Ruby object, and the getter method will return the new dog, but the change is not persisted in the database until we call save.


### Release 2: Making a New Dog for a Rating
```ruby
new_rating = Rating.new(coolness: 8, cuteness: 9, judge_id: 5)
# => #<Rating id: nil, coolness: 8, ... dog_id: nil ... >
new_rating.create_dog(name: "Toot", license: "OH-1234567", owner_id: 4)
# => #<Dog id: 4, name: "Toot", ... >
new_rating
 => #<Rating id: nil, coolness: 8, ... dog_id: 4, ... >
new_rating.dog
# => #<Dog id: 4, name: "Toot", ... >
new_rating.save
# => true
```
*Figure 9*. Making a Dog for a Rating

When we assign the dog to which a rating belongs using the setter method, we must have a dog object to pass as the argument.  Sometimes we find ourselves with just a rating object and the attributes for a dog, but not an actual dog object.  In such a case, we can choose to build or create a dog for the rating.  And again, Active Record will handle the foreign key work, so that the dog we make is associated to our rating.

In Figure 9 we create a new rating object.  We supply all the attributes for the object except for the dog id.  When we instantiate the object, it's dog id attribute is set to `nil`.  This rating was made for a dog, but that dog does not yet exist in our database.

We create the dog using one of the other methods provided by `.belongs_to`:  the `#create_dog` method.  This method allows us to create a new dog and associate it with our rating at the same time.  We can see that when we call the `.create_dog` method, it saves a new dog to the database and updates the foreign key value of `new_rating`.  And we can now access the newly created dog through our rating's getter method, `#dog`.

*Note:*  In this case we used `.create_dog` which persists the new dog in the database before we actually save the rating.  Alternatively, we could use `.build_dog` to create the dog object in Ruby but not persist it in the database until we persist the rating.  This is another example of Active Record providing paired methods where one method tries to persist an object and the other requires saving records manually.


### Release 3:  Treating Dog Like an Attribute of Rating
```ruby
tenley = Dog.find_by(name: 'Tenley')
# => #<Dog id: 1, name: "Tenley", ... >
new_rating = Rating.new(judge_id: 2, dog: tenley, coolness: 8, cuteness: 10)
# => #<Rating id: nil, ... judge_id: 2, dog_id: 1,  ... >
new_rating.dog
# => #<Dog id: 1, name: "Tenley", ... >

jayda = Dog.find_by(name: 'Jayda')
# => #<Dog id: 2, name: "Jayda", ... >
new_rating.assign_attributes(judge_id: 1, dog: jayda)
# => nil
new_rating
# #<Rating id: nil, ... judge_id: 1, dog_id: 2, ... >
new_rating.dog
# => #<Dog id: 2, name: "Jayda", ... >
```
*Figure 10*.  Treating a rating's dog like its attributes.

We can also think about the dog to which a rating belongs as an attribute of the rating.  A rating has attributes derived from the ratings table:  a coolness score, a cuteness score, a judge id, and a dog id.  But, we can also think of a rating's dog in sort of the same way—particularly when it comes to assigning a dog to a rating.

In Figure 10 we have two examples of treating a dog the same way as we do a rating's other attributes.  First, we instantiate a new rating by passing in a hash of the new rating's attributes.  But, instead of having a `:dog_id` key with a number value, we have a `:dog` key with the value of an actual dog object.  We let Active Record figure out what to do with the dog id foreign key assignment.  Compare this to the way we set up the judge id.  There we actually have to know the id of the judge, not just have a judge object.

We use the same technique later when we call `#assign_attributes` to update the dog and judge id.  For the dog, we let Active Record take care of updating the foreign key based on the dog object we pass in.  With the judge id, we pass in the specific id value ourselves.

*Note:*  These techniques work because of how Active Record handles the hashes that are passed to each of these methods.  It does something with each of the key-value pairs in the hash.  Do we remember what it does with them, or can we hypothesize what it's doing?

Each key-value pair is used to call a setter method on the rating object.  So, in Figure 10, when we instantiate a new rating and pass the hash containing a `:dog` key with the value of our `tenley` dog object, Active Record calls `:dog=` on the rating passing the dog object as the argument.


### Release 4:  Declare Belongs To Associations
In the *Summary* section, two other belongs to associations were described:

- a dog belongs to an owner
- a rating belongs to the judge who did the rating

Declare these associations in the appropriate classes.  We'll be breaking convention, so we'll need to configure our associations.  Tests have been provided to let us know whether or not our associations have been set up properly.


### Release 5:  Explore Methods Generated by Belong To
We've briefly looked at the methods generated when we declare a belongs to association.  We need practice using them.  Let's take some time to explore these methods in the console.  Pull ratings and dogs from the database or create new ones and explore the getter and setter methods.  Reassign the dogs and judges to which ratings belong.  Reassign the owner to which a dog belongs.  Build or create new dogs for ratings and so on.  Look at the SQL generated when we run these methods; is it what we expect?  In general, build familiarity with these methods before moving on.


## Conclusion
Active Record associations are going to play a big role in our applications as we move through Dev Bootcamp, and the belongs to association is one of the major association types.  We need to be familiar with it:  both how to declare the association and how to employ the methods provided to us when we make the declaration.

In declaring the association, we should be familiar with the basic syntax.  But, before we can declare the association, we need to be able to identify where declaring a belongs to association is possible.  Do we remember on which table the foreign key should exist?  Also, we should understand the conventions around naming involved in declaring associations.  There will be times when we need or want to break convention, and we'll need to know how to configure our associations.  What are the conventions Active Record expects when we declare a belongs to association?

As for the generated methods, each provides a different way of ultimately doing the same thing:  associating one object with another (e.g., a rating with a dog).  By handling all of the foreign key work, they make associating objects with each other more convenient than it might otherwise be.  In different circumstances, different approaches will be more or less appropriate.  By knowing what options are available and how to use them, we can apply them to write succinct, readable code.  In particular, being able to use the getter and setter methods is a fundamental skill we need to have coming out of this challenge.
