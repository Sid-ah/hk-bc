# Active Record Intro:  Has Many

## Summary

![Database Schema](schema_design_new.png)

*Figure 1*.  Schema design for this challenge, showing connections between primary keys and foreign keys.

This challenge assumes that we've completed and are comfortable with the material from the [Active Record Intro challenge on the belongs to association](../../../active-record-intro-belongs-to-association-challenge).  Working with the schema shown in Figure 1, in that challenge we wrote a few belongs to associations for our models:

- a dog belongs to an owner/person
- a rating belongs to the judge/person who did the rating
- a rating belongs to the dog that was rated

In this challenge we'll take a look at the *has many* association.  A has many association is the inverse of the belongs to association; it's the other side of a one-to-many relationship.  Taking the belongs to associations that we wrote for our models, we can write inverse has many associations:

- an owner/person has many dogs
- a judge/person has many ratings
- a dog has many ratings

### Identifying a Has Many Association

As with the belongs to association, matching foreign keys to primary keys makes the has many association possible.  We're associating two models with each other; the table of one model needs a foreign key that points the the primary key on the table of the other model.

When we declare a belongs to association, on which model's table would we find the foreign key?  On which the primary key?  The table of the model that belongs to the other model would contain the foreign key.  So, based on our schema, we can say that a rating belongs to a dog.

The has many association is the inverse.  Any time a model's table hold a foreign key that points to another model, we can say this other model has many of the model.  In our schema, we can say that a dog has many ratings because the table for the `Rating` class has a foreign key that points to a dog.


### Declaring a Has Many Association
```ruby
class Dog < ActiveRecord::Base
  belongs_to :owner, { class_name: "Person" }
  has_many :ratings
end
```

*Figure 2.*  Code for the class `Dog` with both a belongs to and has many association defined.

Figure 2 shows a `Dog` class that declares two associations.  We should be familiar with declaring a belongs to association.  We're going to look at how to declare a has many association—it's very similar.

Before we look at the syntax for declaring a has many association, what are the different parts in declaring the belongs to association?  What are `belongs_to`, `:owner`, and `{ class_name: "Person" }`?

Like `.belongs_to`, `.has_many` is a method that will be called on the class we're defining—in this case `Dog`.  It serves the same purpose, too:  `.has_many` is going to provide us with instance methods that allow a dog to interact with ratings.  However, the set of methods provided by `.has_many` is different from the methods provided by `.belongs_to`.

As with declaring a belongs to association, we will get *getter* and *setter* methods.  And again, the method names are derived from the first argument passed to `.has_many`.  In this case, we passed `:ratings`.  Therefore, the getter method is `#ratings` and the setter method is `#ratings=`.  When we declare a has many association, the first argument must be plural.

We also get a number of additional methods.  For example, we get a method for shoveling a `Rating` object into a dog's collection of ratings:  `#ratings.<<`.  We also get getter and setter methods that work with the id values of the associated objects rather than the objects themselves: `#rating_ids` and `#rating_ids=`.  As with `.belongs_to`, we also get methods for building and creating ratings associated with a dog:  `#ratings.build`, `#ratings.create`, and `#ratings.create!`.

We'll explore some of these methods in this challenge.  For a more comprehensive list and description of the methods provided, read the [API Dock description](http://apidock.com/rails/ActiveRecord/Associations/ClassMethods/has_many).


### Active Record Conventions
When we declare a has many association, the conventions we'll follow are very similar to the conventions when declaring a belongs to association.  And, we'll configure broken conventions in the same way.

When we declare a has many association, we pass an argument that says what we we have (e.g. `:ratings` in our example).  Active Record expects to find a class with a name matching this argument.  In this case, we passed `:ratings`, and Active Record expects to find a `Rating` class.  We have one, so we're all right.

In addition, Active Record needs to know how to identify the many ratings that a dog has.  In other words, it needs to know the foreign key on the ratings table that points to a dog.  The convention is that the name of the foreign key will match the name of the model declaring the has many association.  In our case, the `Dog` class is declaring the has many association, so the ratings table should have a foreign key field named `dog_id`.  Again, we're following convention.

```ruby
class Dog < ActiveRecord::Base
  has_many :ratings, { :class_name => "Rating", :foreign_key => :dog_id }
end
```
*Figure 3*.  Passing an options hash when declaring a has many association.

In our example, we're following conventions, so we do not need to configure our association.  If one of these conventions were broken, we would have to configure the association.  In other words, we'd have to tell Active Record where to look.  We can do that with an optional hash argument that we can pass to the `.has_many` method.  Active Record is going to assume that a specific class and a specific foreign key exits.  If they're not there we can pass that information along (see Figure 3).

Earlier in this *Summary* section, we identified a couple more has many associations.  A person, as an owner, has many dogs.  If in the `Person` class we declared the association `has_many :dogs`, would it work?  What conventions would Active Record expect?

Active Record will expect that a class `Dog` exists.  We have one, so we've not broken that convention.  It will also expect that the dogs table has a `person_id` foreign key field, but looking at our schema in Figure 1, there is no `person_id` field on the `dogs` table.  We've broken convention.  Instead, there is an `owner_id` field, and we would need to configure our association by specifying the foreign key field that Active Record should use.


## Releases

### Pre-release: Setup
```
$ bundle install
$ bundle exec rake db:create
$ bundle exec rake db:migrate
$ bundle exec rake db:seed
```
*Figure 4*.  Setting up and seeding the database.

Before we begin, we need to create, migrate, and seed our database.  We'll seed our database with records for all three models:  `Dog`, `Rating`, and `Person`.  All the files necessary for this are provided:  the migrations and the seeds file.  We simply need to run the Rake tasks (see Figure 4).

We're going to work with our `Dog` class from within the Rake console.  Let's begin by opening the console.  Once it's open, we can begin interacting with our models.  As we work through each release, we should execute the provided example code ourselves and look at the return values.


### Release 0: Getting a Dog's Ratings
```ruby
tenley = Dog.find_by(name: "Tenley")
# => #<Dog id: 1, name: "Tenley", license: "OH-9384764", ... >
tenley.ratings
# => #<ActiveRecord::Associations::CollectionProxy [#<Rating id: 1, ... >, #<Rating id: 3, ... >, #<Rating id: 5, ... >]>
```
*Figure 5*.  Getting a dog's ratings.

We're going to explore the methods generated when we declare a has many association, and we'll start with the getter method. When we declare that a dog has many ratings, we're provided with a method to get the dog's ratings. So, given an instance of the `Dog` class, we can ask the dog for its ratings.

In Figure 5, we get an instance of the `Dog` class, the dog named Tenley, and assign it to the variable `tenley`. We then call the `#ratings` getter method provided to us by the `.has_many` method. Through this method, we're able to retrieve Tenley's ratings (i.e. the ratings that were made for Tenley).

What SQL is executed when we get Tenley's ratings?  Active Record knows that Tenley's id is 1.  So, it can go to the ratings table and get all the records with a dog id of 1.

What does the `#ratings` getter method return?  It returns a collection of ratings that were made for Tenley.  If we look at the return value in the console, we'll see that the collection holds ratings 1, 3, and 5.  The exact object type is probably new to us.  It's an `ActiveRecord::Associations::CollectionProxy` object.  It's not an array, but it has very similar behaviors.


### Release 1: Getting the Count of a Dog's Ratings
```ruby
tenley.ratings.count
# => 3
```
*Figure 6*.  Getting the number of ratings made for a dog.

In Figure 6, we're getting the number of ratings that have been made for Tenley.  And, we can see that three ratings have been made for Tenley.

If we look at the syntax, we're chaining two method calls: one to `#ratings` and one `#count`.  But this is not executed the way we might expect.  In Ruby, we would expect calling `tenley.ratings` to be evaluated and then `#count` would be called on the return value.

Active Record will handle this differently.  Active Record interprets this chain as one method: `#ratings.count`.  When the code in Figure 6 is executed, the collection of Tenley's ratings is not returned and then counted.  Instead, Active Record queries the database for the number of ratings made for Tenley.  In the console output, we can see the SQL that was executed:  `SELECT COUNT(*) FROM "ratings" WHERE "ratings"."dog_id" = ?  [["dog_id", 1]]`.

`#ratings.count` is just one of the method chains that Active Record will interpret as one method with regard to a dog's ratings.  We've seen such chain interpretation before when we learned about retrieving data from the database (e.g. `Rating.where(cuteness: 10).order(dog_id: :asc)`).  We'll see more examples like these in later releases.  Let's be sure to take the time to look at the SQL generated by our code, so that we can better understand what Active Record is doing for us.

### Release 2: Giving a Dog Another Rating
```ruby
new_rating = Rating.new(coolness: 8, cuteness: 10, judge_id: 4)
# => #<Rating id: nil, coolness: 8, ... dog_id: nil, ... >
tenley.ratings << new_rating
# => #<ActiveRecord::Associations::CollectionProxy [ ... ]>
new_rating
# => #<Rating id: 8, coolness: 8, ... dog_id: 1, ... >
tenley.ratings.include? new_rating
# => true
```
*Figure 7*. Giving a dog another rating by shoveling the rating into the dog's collection of ratings.

In Figure 7 we make a new rating that we want to associate with Tenley.  When we instantiate the new record, we don't specify the id of the dog for which the rating was made.  Looking at the new rating, we can see that both its id and dog id attributes are both `nil`.  We'll let Active Record handle assigning these values for us.

There are multiple ways of associating a dog with a rating.  One way is to shovel a rating into the dog's collection of ratings—as is done in Figure 7.  We've used the `#ratings.<<` method chain.  We use this much like we would use the `Array#<<` method.  We take Tenley's collection of ratings and shovel in another `Rating` object.  What SQL is executed when we shovel in the new rating?

After calling `#ratings.<<`, when we look at our new rating, it has a value for id and dog_id.  When we shoveled the new rating into Tenley's collection of ratings, Active Record updated the dog id attribute of new record to match Tenley's id attribute.—it also persisted the new record, which assigned the id attribute.


### Release 3: Building a Rating for a Dog
```ruby
tenley.ratings.build(coolness: 7, cuteness: 9, judge_id: 5)
# => #<Rating id: nil, coolness: 7, ... dog_id: 1, ... >
tenley.ratings
# => #<AR::Assoc::CollectionProxy [ ... , #<Rating id: nil, coolness: 7, ... >]>
tenley.save
# => true
tenley.ratings
# => #<AR::Assoc::CollectionProxy [ ... , #<Rating id: 9, coolness: 7, ... >]>
```
*Figure 8*.  Building a rating that will be associated with a dog.

In the previous release, we instantiated a new rating and then associated it with a dog.  In Figure 8, we're building a rating that is associated with a specific dog from the time it's instantiated.

When we learned about the methods generated by the `.belongs_to` method, we saw methods for a rating like `#build_dog` and `#create_dog`.  Similar methods are generated by `.has_many`.  For a dog with many ratings, we have the methods `ratings.build`, `ratings.create`, and `ratings.create!`.

In Figure 8, we instantiate a new rating for Tenley, using the `#ratings.build` method.  The new rating has its dog id attribute set to Tenley's id at the time it is instantiated.  After building the new rating, we can see that the new rating is now in Tenley's ratings collection.  The new rating's id is 'nil' because it's not been persisted yet.  The object only lives in-memory in Ruby.

To persist the new record in the database, we call save on Tenley, not on the rating itself.  Look at the SQL that's executed when we ran `tenley.save`.  Saving Tenley cascaded down to Tenley's ratings, resulting in a SQL `INSERT` statement for the ratings table.


### Release 4:  Mass Reassigning a Dog's Ratings
```ruby
rating_ids = tenley.rating_ids
# => [1, 3, 5, 8, 9]
tenley.ratings = []
# => []
tenley.ratings.empty?
# => true
Rating.find rating_ids
# => [#<Rating id: 1, ... dog_id: nil, ... >, #<Rating id: 3, ... >, #<Rating id: 5, ... >, #<Rating id: 8, ... >, #<Rating id: 9, ... >]
tenley.rating_ids= rating_ids
# => [1, 3, 5, 8, 9]
tenley.ratings
# => #<AR::Assoc::CollectionProxy [#<Rating id: 1, ... >, #<Rating id: 3, ... >, #<Rating id: 5,  ... >, #<Rating id: 8, ... >, #<Rating id: 9, ... >]>
```
*Figure 9*.  Examples of assigning a collection of ratings to a dog.

In the previous two releases, we've looked at associating ratings with a dog one at a time.  But we can also do a mass reassignment of a dog's ratings.

In Figure 9, we look at two different ways of assigning a collection of ratings to a dog: by giving a dog a new collection and by telling a dog the ids of ratings.

We begin by getting the ids of Tenley's ratings, and assigning them to the variable `rating_ids`.  We see that ratings 1, 2, 3, 8, and 9 were made for Tenley.  Then we reassign Tenley's ratings, using the `#ratings=` setter method.  We pass an empty array, which results in Tenley having no ratings.  Tenley's ratings collection is now empty.  We could have passed an array containing ratings; the important take away is that we can reassign a dog's collection of ratings.

What happened to Tenley's old ratings?  The records are still in the database.  When we find those ratings by their ids, we see that their dog id values have been updated to be `nil`.  The link between these ratings and Tenley has been broken. They're ratings, but they're not associated with any dog.

We previously saved the ids of Tenley's old ratings in the variable `rating_ids`.  We use the ids to give Tenley back her ratings.  We assign a new collection of ratings by calling `#rating_ids=` and passing an array of ids.  We can see that Active Record makes a series of `UPDATE` SQL queries—one for each of the ids—to reestablish the connection between the rating and Tenley.


### Release 5:  Declare Has Many Associations
In the *Summary* section, two other has many associations were described:

- an owner/person has many dogs
- a judge/person has many ratings

Declare these associations in the appropriate classes. We'll be breaking convention, so we'll need to configure our associations. Tests have been provided to let us know whether or not our associations have been set up properly.


### Release 6: Explore Methods Generated by Has Many

We've briefly looked at the methods generated when we declare a has many association. We need practice using them. Let's take some time to explore these methods in the console. Pull people and dogs from the database or create new ones and explore the getter and setter methods generated by their has many associations. Reassign an owner's dogs and a judge's ratings.  Reassign with collections and with ids. Build or create new dogs for owners. Look at the SQL generated when we run these methods; is it what we expect? In general, build familiarity with these methods before moving on.


### Conclusion
As has been said in other challenges, Active Record associations are going to play a big role in our applications as we move through Dev Bootcamp.  The has many association is one of the major association types. We need to be familiar with it: both how to declare the association and how to employ the methods provided to us when we make the declaration.

In declaring the association, we should be familiar with the basic syntax. But, before we can declare the association, we need to be able to identify where declaring a has many association is possible.  Also, we should understand the conventions around naming involved in declaring associations. There will be times when we need or want to break convention, and we'll need to know how to configure our associations. What are the conventions Active Record expects when we declare a has many association?

As for the generated methods, each provides a different way associating objects of one type with another (e.g., a dog with its ratings). By handling all of the foreign key work, these methods make associating objects with each other more convenient. In different circumstances, different approaches will be more or less appropriate.  Do we need to associate a collection of items at one time or just one object? By knowing what options are available and how to use them, we can apply them to write succinct, readable code. In particular, being able to use the getter and setter methods is a fundamental skill we need to have coming out of this challenge.

