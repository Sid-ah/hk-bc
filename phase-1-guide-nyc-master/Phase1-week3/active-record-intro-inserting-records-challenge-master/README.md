#Active Record Intro:  Inserting Records

## Summary
In this challenge, we'll be working with Active Record models in the Rake console.  Our focus will be on inserting new records into the database using the methods provided by Active Record.

```ruby
class Dog < ActiveRecord::Base
end
```

*Figure 1.*  Code for the class `Dog`.

We will be working primarily with a pre-written, empty `Dog` class (see Figure 1 and the file `app/models/dog.rb`).  There are no methods defined within the class itself.  The behaviors that we'll explore in this challenge are inherited through its parent class, `ActiveRecord::Base`.

Among these inherited methods, are class methods for inserting records into the database.  Just as it is the responsibility of our plain Ruby classes to instantiate new instances of themselves, Active Record model classes are also responsible for instantiating instances of themselves.  We'll take a look at different approaches that Active Record provides.

### Instantiation vs. Persistence
We need to make a distinction between creating objects in Ruby that exist in our computer's memory and persisting the state of these objects (i.e., the data that represents them) in the database.  As our Ruby programs run, they create in-memory objects, but these objects do not necessarily need to be saved to the database.  Sometimes we will want to persist the data associated with an object and sometimes we won't.  Active Record often provides paired methods—one that instantiates objects and a counterpart that creates objects and saves them to the database.


## Releases
### Pre-release: Setup
```
$ bundle install
$ bundle exec rake db:create
$ bundle exec rake db:migrate
$ bundle exec rake db:seed
```
*Figure 2*.  Setting up and seeding the database.

Before we begin inserting records into the database, we need to create our database. We'll seed it with a few records, too.  All the files necessary for this are provided:  the migrations and the seeds file.  We simply need to run the Rake tasks (see Figure 2).

```
bundle exec rake console
```
*Figure 3*.  Executing the Rake task to open IRB with our environment loaded.

We're going to work with our `Dog` class from within the Rake console.  Let's begin by opening the console (see Figure 3).  Once it's open, we can begin interacting with our models.  As we work through each release, we should execute the provided example code ourselves and look at the return values.

### Release 0: Instantiating a New Object
```ruby
new_dog = Dog.new(name: "Bear")
```
*Figure 4*.  Instantiating a new dog.

Active Record provides the same interface for instantiating new objects that we're used to using with our plain Ruby classes:  we call `.new` on our class and pass in a hash of attribute values.  In Figure 4, we're creating a new instance of the `Dog` class and assigning its name attribute the value `"Bear"`.  The attributes that we didn't specify have been set to `nil`, as we might expect.  Notice, the value of the `id` attribute; it is also `nil`.

In our plain Ruby classes, each of the keys in the hash we pass in maps to an instance variable that we want to set in our `#initialize` method.  A similar thing happens here.  In the case of Figure 4, we end up with a dog object with the name `"Bear"`.  But there is a catch.

```ruby
Dog.new(color: "brown")
```
*Figure 5*.  Instantiating a dog with an unknown attribute.

In Figure 4, we're able to set the name of our dog because the dogs table in the database has a name column—the key in the hash matched a column on the table.  What happens when keys in the hash we pass in don't match the columns in the database table (see Figure 5)?

In our plain Ruby objects, we probably just ignore unexpected keys, but Active Record won't ignore them.  It tries to set the value of all keys in the hash.  If the attribute doesn't exist, it throws an error.  When we run the code in Figure 5, what type of error is produced?


### Release 1: Persisting an Object
In *Release 0* we created a new dog object, and we assigned it to the variable `new_dog` (see Figure 4).  This object exists only in memory, and it is not backed up in the database.

```ruby
Dog.count
```
*Figure 6*. Determining how many dog records exist in the database.

When we seeded our database in the *Pre-release* section, we inserted three dogs into the database (see file `db/seeds.rb`).  If we check the count of dog records in the database (see Figure 6), we'll see that there are three records in the dogs table: the three that were inserted when we seeded the database.

```ruby
new_dog.persisted?
```
*Figure 7*.  Asking a dog object if it's been saved.

```ruby
new_dog.save
```
*Figure 8*.  Saving a dog to the database.

We can even ask the object itself if it's been saved to the database (see Figure 7).  After we instantiate a new instance of dog, if we want to store its data in the database, we have to call `#save` on the object (see Figure 8).

Calling `#save` on our object will tell Active Record that we want to write to the database.  In this case, we want to write a new record.  What type of SQL query would Active Record need to generate and execute?

Our dog object was not previously in the database, so calling `#save` generates and executes an insert query.  In this case, something like `INSERT INTO "dogs" ("name", ...) VALUES (?, ...)  [["name", "Bear"], ...]`

If the record was saved successfully, the `#save` method returns `true`; otherwise, it returns `false`.

Now that we've saved our dog object, we should see some changes.  Let's take a look at the value of the variable `new_dog`.  What happened to its `id`, `created_at`, and `updated_at` attributes?  What are their values?  Does our dog object report that it's now persisted?  What is the count of dogs in the database?


### Release 2:  Instantiate and Save at the Same Time
```ruby
Dog.create(name: "Max")
```
*Figure 9*.  Instantiating and saving a dog with the `.create` method.

In *Release 0* and *Release 1* we created an in-memory Ruby object and then later persisted the state of that object in the database.  There are times when this approach is appropriate, but there are other times when we might want to instantiate a new object and save it to the database at the same time.  `.create` gives us this option (see Figure 9).

`.create` will instantiate the new object, assign its attributes, and attempt to save it to the database.  However, whereas `#save` returns a true/false value depending on whether or not writing to the database was successful, `.create` will always return the newly instantiated object.  If the save was successful, the object will have its `id` attribute assigned.  If the save was unsuccessful, the object's `id` will be `nil`.

Having run the code in Figure 9, we should see that the count of dogs in the database has increased to five.


### Release 3:  Creating Multiple Dogs at the Same Time
```ruby
Dog.create [{name: "Toot"}, {name: "Cosmo"}]
```
*Figure 10*. Creating two dogs at the same time.

So far, we've been creating single dog objects, but we might find ourselves in a position where we need to create multiple dogs.  We can create multiple records with one call to `.create` by passing an array of argument hashes (see Figure 10).


### Release 4:  Find a Dog or Make a New One
Sometimes we are unsure whether a record already exists in the database.  For example, is there already a dog named Tenley with this license number?  There are a couple methods that will look for a record in the database and if it's there, return it, and if not, create a new object.  And similar to the relationship between `.new` and `.create`, we can just initialize the object or both initialize and save the object.

```ruby
Dog.find_by(license: "OH-9384764")
```
*Figure 11*.  Finding the dog with license OH-9384764.

When we seeded our database we inserted three dogs.  One of the dogs was named Tenley and had the license OH-9384764.  We can use the `.find_by` method to pull this record from the database (see Figure 11).  We'll see that the returned instance of `Dog` has the id 1.

Imagine we're working with an application where we need to register dogs—maybe it's a veterinary clinic.  We need to register a dog, but we're unsure whether or not the dog is already in our system.  If it is, we want to use the existing database record.  If not, we'll need to make a new record for the dog.

```ruby
Dog.find_or_initialize_by(license: "OH-9384764")
```
*Figure 12*.  Find and return the dog with license OH-9384764 or instantiate an object with that license.

In Figure 12 we want to return the dog with license number OH-9384764, if such a record exists in the database.  We can see in the console output that Active Record executes a SQL query similar to `SELECT  "dogs".* FROM "dogs"  WHERE "dogs"."license" = 'OH-9384764' LIMIT 1`.

In this case, such a record exists and so `.find_or_initialize_by` returns the object.  We can see that this dog's name is Tenley and that it has the id 1.

```ruby
Dog.find_or_initialize_by(license: "MI-1234567")
```
*Figure 13*. Find and return the dog with license MI-1234567 or instantiate an object with that license.

In Figure 13 we're looking for a dog with a different license—one not in the database.  Because a matching record is not found in the database, Active Record instantiates a new `Dog` object and assigns the attributes that we we're looking for.

Like the `.new` method, `.find_or_initialize_by` does not attempt to save the record to the database.  We can see that the object's id is `nil`.  We would need to call `#save` on the returned instance if we wanted to save to the database.

```ruby
Dog.find_or_create_by(name: "Taj", license: "OH-9084736")
```
*Figure 14*. Find and return the dog with the name Taj and license OH-9084736 or instantiate and save an object with that name and license.

If we decide that if a matching record doesn't exist in the database, in addition to instantiating an object we also want to save the object, we can use `.find_or_create_by`.  This method is similar to `.find_or_initialize_by` except that if it doesn't find a record matching the given attributes, it both instantiates a new object with those attributes and also attempts to save it to the database.

In the console output displayed when running the code in Figure 14, we can see that two SQL queries were run.  First, Active Record attempted to find a record with the supplied attributes.  Then, after not finding a match, Active Record attempted the save a new record with the supplied attributes with a query similar to `INSERT INTO "dogs" ("license", "name", ...) VALUES (?, ?, ...)  [["license", "OH-9084736"], ["name", "Taj"], ...]`.

The returned `Dog` object has an id assigned (i.e., it's not `nil`), so we know that the save was successful.


### Release 5: Insert new Records
In the console, practice inserting new records into the database using the methods outlined above.  Create some dogs, people, and ratings.  Use `.new` and `#save`.  Use `.create`.  Make records one at a time.  Make multiple records at the same time.  Use `.find_or_initialize_by` and `.find_or_create_by`.  Take this time to build familiarity with these methods.  We'll be relying on them heavily throughout the rest of Dev Bootcamp.


## Conclusion
This challenge exposed us to different approaches we can take when working with Active Record models and persisting them.  In particular, we need to be certain we understand the difference between `.new`/`#save` and `.create`.  When we build our applications, sometimes we'll want to take one approach and sometimes the other.  Before moving on, let's be sure that we understand the different methods outlined in this challenge.
