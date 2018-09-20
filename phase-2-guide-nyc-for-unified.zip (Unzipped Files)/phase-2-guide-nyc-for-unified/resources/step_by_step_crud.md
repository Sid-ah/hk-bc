# Step by Step CRUD

## Understand the Domain
1. [ ] Discuss the domain (with others or yourself).
1. [ ] Write down the user stories (features that you plan to support).
1. [ ] Develop an understanding of how each noun (model/table) will relate to each other.

## Schema
1. [ ] Draw the schema. _Don't name any join tables as the combination of two other tables, find a unique noun._
1. [ ] Double check your schema for any columns that don't follow convention (e.g. foreign keys should end in `_id`).
1. [ ] Ensure you've chosen the most appropriate data type (integer, string, boolean, etc) for each column.

## Migrations
1. [ ] Create the migrations for each table.
1. [ ] Check that everything that matches your schema design.
1. [ ] Migrate (note, you don't need any models defined to migrate!)

## Models
1. [ ] Create the ActiveRecord models.
1. [ ] Verify your models are in good shape by saving an instance of each to the database. (via `rake console`).

## Associations
1. [ ] Add one or two associations to your models at a time. _Don't do them all at once._
1. [ ] As you add each association, update your `seeds.rb` to make use of the association. Be sure to use the bang versions (`create!` and `save!`) so any errors are printed when you run `rake db:seed`. Consider `seeds.rb` your scratch pad as you develop & test your associations.
1. [ ] Review your `seeds.rb` and make sure you aren't manually setting any `_id` attributes. Set the association instead (`president` instead of `president_id`). Also, _don't "guess" any values for a foreign key!_ If you need a random `User`, pick a random one with `User.all.sample` instead of just entering an id that may disappear as you make changes to your database.
1. [ ] Jump back and forth between dropping, migrating, seeding and the console to verify everything. Keep a checklist so you can be sure you've tested & verified each association is working like you expect.

## Seeding
1. [ ] By now your `seeds.rb` might be a bit messy since you used it as a scratch pad. Review `seeds.rb` and make sure you've got a decent set of data to test you application once you start creating the web interface. Now might be a good time to review your user stories/features.

## CRUD
Now it's time to create the routes & views for your app. Start with the easiest to the most difficult. Be sure to follow the RESTful routing conventions. Nearly every URL should include the plural form of the model (`/comments/...`).  

Routes & views that display data (index & show) are going to be very helpful for testing that your app is working, so be sure you get those working first -- and working well.


Repeat the following for each model you plan on exposing CRUD functionality for (only create the routes & view for the CRUD actions you need!):

1. [ ] Create a new controller file (`app/controllers/plural_model_name.rb`)
1. [ ] Create a view folder (`app/views/plural_model_name`)
1. [ ] Create the `index` route & view
1. [ ] Create the `show` route & view
1. [ ] Create the `new` route & view + the `create` route
1. [ ] Create the `edit` route & view + the `update` route
1. [ ] Create the `delete` route.
