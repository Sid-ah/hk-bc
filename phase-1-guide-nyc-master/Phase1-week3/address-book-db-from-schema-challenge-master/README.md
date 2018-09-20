# Modeling a One-to-many Relationship in Ruby

## Summary
We're going to be working with two classes:  `Group` and `Contact`.  Each class is backed by our database.  The classes are provided with behaviors for persisting themselves in the database.  We can save new groups and contacts in our database, we can pull records out of the database, we can update records in the database, etc.

However, the classes are independent of each other.  We can't ask a group which contacts it has.  And conversely, we can't ask a contact to which group it belongs.

At least not yet.  That's the behavior we're going to add in this challenge.  We're going to write methods that allow us to associate groups and contacts with each other.  For example, we'll be able tell a group that it has a new contact and tell a contact that it belongs to a specific group.


## Releases
### Pre-release: Setup the Database
In order for our `Group` and `Contact` classes to work properly, we need a database with a `groups` table and a `contacts` table.  The file `setup.rb` will create this database for us; all we need to do is run the file:

```
$ ruby setup.rb
```

*Note:* If we somehow break our database, we can rerun this file to remove the old database file and create a new one.  We'll lose any data in the database, but it is an option.


### Release 0: A Contact Belongs to a Group
![schema](readme-assets/schema.png)  
*Figure 1*. Database schema visualization.

The schema for the database we created is represented in Figure 1.  What type of relationship exists between groups and contacts?

**STOP:** The previous paragraph is one of the most important paragraphs in
Phase 1. It introduces key concepts for looking at tables and understanding
their relationship. Do not "cruise" through that paragraph without making sure
that you can explain the terms to your pair -- and to yourself!

What we want to do in this release is to model a contact belonging to a group in ruby.  We're going to update our `Contact` model with behaviors related to belonging to a group.  Tests for these behaviors are written in the `"belonging to a group"` example group in `spec/contact_spec.rb`.  Update the `Contact` class to pass the tests.

When we're done, we'll have code that we can use as seen in Figure 2. To follow along in IRB, load the `config.rb`, `group.rb`, and `contact.rb` files.

```ruby
nighthawks = Group.new("name" => "Nighthawks")
nighthawks.save
nighthawks.id
# => 1

sammy = Contact.new("name" => "Sammy")
sammy.group_id
# => nil
sammy.group
# => nil

sammy.group = nighthawks
sammy.group_id
# => 1
sammy.group
# => #<Group:0x007f8aa9201be8 @id=1, @name="Nighthawks", @created_at=#<DateTime: 2016-06-10T15:36:59+00:00 ((2457550j,56219s,0n),+0s,2299161j)>, @updated_at=#<DateTime: 2016-06-10T15:36:59+00:00 ((2457550j,56219s,0n),+0s,2299161j)>>
```  
*Figure 2*.  Assigning a contact to a group.


### Release 1: A Group has Many Contacts
We've begun to model a one-to-many relationship in ruby by making a contact belong to a group.  Now we're going to model the other side of the relationship:  a group having many contacts.

We're going to update our Group model with behaviors related to having contacts. Tests for these behaviors are written in the `"having many contacts"` example group in `spec/group_spec.rb`. Update the `Group` class to pass the tests.

When we're done, we'll have code that we can use as seen in Figure 3. To follow along in IRB, load the `config.rb`, `group.rb`, and `contact.rb` files.

```ruby
nighthawks = Group.new("name" => "Nighthawks")
nighthawks.save
nighthawks.id
# => 1

robb = Contact.new("name" => "Robb")
robb.group_id
# => nil

michael = Contact.new("name" => "Michael")
michael.group_id
# => nil

nighthawks.contacts
# => []
nighthawks.contacts = [robb, michael]
nighthawks.contacts
# => [#<Contact:0x007fa71419adf8 @id=1, @name="Robb", @phone=nil, @email=nil, @group_id=1, @created_at=#<DateTime: 2016-06-13T17:16:07+00:00 ((2457553j,62167s,0n),+0s,2299161j)>, @updated_at=#<DateTime: 2016-06-13T17:16:07+00:00 ((2457553j,62167s,0n),+0s,2299161j)>>, #<Contact:0x007fa714199b38 @id=2, @name="Michael", @phone=nil, @email=nil, @group_id=1, @created_at=#<DateTime: 2016-06-13T17:16:07+00:00 ((2457553j,62167s,0n),+0s,2299161j)>, @updated_at=#<DateTime: 2016-06-13T17:16:07+00:00 ((2457553j,62167s,0n),+0s,2299161j)>>]

robb.group_id
# => 1
michael.group_id
# => 1

sasha = Contact.new("name" => "Sasha")
nighthawks.add_contact(sasha)
sasha.group_id
# => 1
```  
*Figure 3*.  Assigning contacts to a group.


## Conclusion
We've modeled objects with relationships to each other before:  todo lists with items, orange trees with oranges, etc.  And we've modeled those relationships as database schemas.  In this challenge, we've put both of these together.  We've taken a database designed with a one-to-many relationship between groups and contacts and we've modeled our Ruby classes with behaviors that reflect that relationship.
