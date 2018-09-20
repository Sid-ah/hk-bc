# AR Associations Drill: At the Races

## Summary
This challenge is a drill to work with [Active Record associations][RailsGuides Associations].  We'll be working with [`:belongs_to`][belongs_to] and [`:has_many`][has_many] associations.  We'll practice breaking Active Record conventions and passing options like `:class_name`, `:through`, and `:source` when declaring associations.

![](races_schema.png)

*Figure 1*. Schema design for this challenge.

We'll focus on writing associations in this challenge, but let's imagine that we're building a full application that allows for scheduling races.  Then, jockeys can sign up to ride a horse in a race.  Figure 1 shows a schema that will support this described functionality. 

When our associations have been written, we'll be able to answer the following questions.

*For an entry ...*

1. Which jockey is entering a race?
2. Which horse is being ridden?
3. For which race was the entry made?

*For a horse ...*

1. In which races has the horse been ridden?
2. Which jockeys have ridden the horse?

*For a jockey ...*

1. Which races has the jockey entered?
2. Which horses has a jockey ridden?

*For a race ...*

1. Which jockeys have ridden in the race?
2. Which horses have ridden in the race?


### Breaking Convention
Active Record provides a lot of functionality with very little code—provided that we follow its conventions.  However, sometimes it is necessary or desirable to break these conventions.

```ruby
class User < ActiveRecord::Base
  has_many :views
  has_many :purchases
  has_many :reviews

  has_many :viewed_items, { through: :views }
  has_many :purchased_items, { through: :purchases }
  has_many :reviewed_items, { through: :reviews }
end
```
*Figure 2*. Defining multiple associations between a user and items.

When might it be necessary to break conventions with regard to naming our associations?  Associations exist between models.  If a given model has two different associations with another model, they need different names.  Imagine an online shopping application with a `User` model and and `Item` model.  A user might have viewed items, purchased items, and reviewed items (see Figure 2).  

All of these associations would be between `User` and `Item`. What would happen if these associations all had the same name (e.g., `:items`)?  Remember that declaring these associations creates methods for instances of `User`.  The first time we declare `has_many :items`, methods like `:items` and `:items=` are created.  What happens if a second `has_many :items` association is declared?  New `:items` and `:items=` methods would be written, essentially overwriting the first set of methods.  To avoid this, we sometimes need to break conventions in declaring associations.

And then sometimes we want to break convention because it makes our code more readable.  In the example above, what would it mean for a user to have many items?  What relationship would such an association represent?  Is it viewed items, purchased items, reviewed items, items they have for sale, etc.?  As with variable and method names, we want the names of our associations to be descriptive of the actual relationship between the two models.


##Releases

### Pre-release: Setup
The necessary models and migrations have been provided for us.  We will need to set up the database though.  Lets bundle to make sure that the necessary gems are installed and then create and migrate our database.


### Release 0: Declare the Associations
Tests for each model's associations have been written to provide feedback on the associations that we write (see the files in `spec/models/`).  When all of the test pass, our associations are written properly.

In order to write the desired associations, we'll need to be familiar with declaring different types of associations:

- [:belongs_to][RailsGuides belongs_to]
- [:has_many][RailsGuides has_many]
- [:has_many with the :through option][RailsGuides has_many through]
- [:has_many with the :through and :source options][StackOverflow on source]


## Conclusion
We should be getting comfortable with writing ActiveRecord associations.  We should be able to look at a schema and deduce the types of associations that could exist between models—whether they're belongs to or has many associations.  

We should also be able to implement those associations in our models, providing configuration where convention is broken.  Do we understand why the different options need to be specified when we break convention in declaring our associations?  When do we need to specify a class name?  When do we need to specify a source?

[belongs_to]: http://apidock.com/rails/ActiveRecord/Associations/ClassMethods/belongs_to
[has_many]: http://apidock.com/rails/v4.2.1/ActiveRecord/Associations/ClassMethods/has_many
[RailsGuides Associations]: http://guides.rubyonrails.org/association_basics.html
[RailsGuides belongs_to]: http://guides.rubyonrails.org/association_basics.html#the-belongs-to-association
[RailsGuides has_many]: http://guides.rubyonrails.org/association_basics.html#the-has-many-association
[RailsGuides has_many through]: http://guides.rubyonrails.org/association_basics.html#the-has-many-through-association
[StackOverflow on source]: http://stackoverflow.com/questions/4632408/need-help-to-understand-source-option-of-has-one-has-many-through-of-rails
