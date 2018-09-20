# AR Associations Drill:  Hotels

## Summary
This challenge is a drill to work with [Active Record associations][RailsGuides Associations].  We'll be working with [`:belongs_to`][belongs_to], [`:has_many`][has_many], and [`:has_one`][has_one] associations.  We'll practice breaking Active Record conventions and passing options like `:class_name`, `:foreign_key`, `:through`, and `:source` when declaring associations.

![](hotels_schema.png)

*Figure 1*. Schema design for this challenge.

We'll focus on writing associations in this challenge, but let's imagine that we're building a full application that allows for booking hotel rooms. Hotels register their rooms with our application, and users can book the hotels' rooms.  We won't worry about booking dates and other real-world details.  We just want to focus on how we can associate our models with each other.
 
When our associations have been written, we'll be able to answer the following questions.

*For a User ...*

1. Which bookings were made by the user?
2. Which rooms has the user booked?
3. At which hotels has the user booked a room?


*For a Hotel ...*

1. Which rooms are at the hotel?
2. Which bookings have been made at the hotel?
3. Which guests have booked rooms at the hotel?

*For a Room ...*

1. In which hotel is the room found?
2. Which bookings are for the room?

*For a Booking ...*

1. For which guest is the booking?
2. For which room is the booking?
3. For which hotel is the booking?

## Releases

### Pre-release: Setup the Database
Before working through this challenge we need to setup the database.  The necessary migrations have been provided for us; don't edit them.  Let's bundle to make sure that the necessary gems are installed and then create and migrate our database.


### Release 0: Declare the Associations
An empty class is provided for each model.  We are going to declare associations in these classes.  Tests for each model's associations have been written to provide feedback on the associations that we write (see the files in `spec/models/`).  When all of the tests pass, our associations are written properly.

In order to write the desired associations, we'll need to be familiar with declaring different types of associations:

- [:belongs_to][RailsGuides belongs_to] (including its options)
- [:has_many][RailsGuides has_many] (including its options)
- [:has_one][RailsGuides has_one] (including its options)


## Conclusion

In this challenge our goal was to write some more advanced Active Record associations.  After completing this challenge, we should have a better handle on when to use the different association types (e.g., belongs_to vs. has_many), the naming conventions around Active Record associations (e.g., what classes does Active Record expect to find) and how to break those conventions, and how to use a join model to associate two other models with each other.

[belongs_to]: http://apidock.com/rails/ActiveRecord/Associations/ClassMethods/belongs_to
[has_many]: http://apidock.com/rails/v4.2.1/ActiveRecord/Associations/ClassMethods/has_many
[has_one]: http://apidock.com/rails/v4.2.1/ActiveRecord/Associations/ClassMethods/has_one
[RailsGuides Associations]: http://guides.rubyonrails.org/association_basics.html
[RailsGuides belongs_to]: http://guides.rubyonrails.org/association_basics.html#the-belongs-to-association
[RailsGuides has_many]: http://guides.rubyonrails.org/association_basics.html#the-has-many-association
[RailsGuides has_one]: http://guides.rubyonrails.org/association_basics.html#the-has-one-association

