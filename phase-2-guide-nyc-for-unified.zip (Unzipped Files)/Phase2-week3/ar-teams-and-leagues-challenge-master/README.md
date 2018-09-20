# Playing in leagues with ActiveRecord

## Objectives
* modeling a many-to-many relationship using a join model
* using more meaningful (non-conventional) names for associations.
* seeding records in a complex schema

## Playing in a League
You'll be modeling a simple application for tracking users and their intramural teams and leagues. This challenge is all about ActiveRecord, it doesn't include an interface.

Your challenge is to create migrations, models and seed data for the following models:

1. User
2. Membership
3. Team
4. League

## Requirements
* A user has many teams, and a team has many users
* A user is the captain of a team 
* A user can create one league
* A membership includes the team and the user
* A league has many teams
* A league has a creator
* A team has one captain

Run the tests to see the full set of requirements.

## Logistics
You'll need to follow the directions in the fixtures file to drive the organization of your application. You need to create your migrations, associations, and models along with your fixture data. Once filling in these pieces, your code is expected to pass all the existing tests.

**Note: you'll be creating your seed data in the "spec/fixtures/fixtures.rb" file since we are only using this data for testing purposes.**

## Running the Challenge
There are four specs in this challenge. 

You'll need to run `be rake db:test:prepare` before running your tests.

Run them in order:

```
└── spec
    ├── 01_users_spec.rb
    ├── 02_leagues_spec.rb
    ├── 03_team_spec.rb
    ├── 04_priscilla_spec.rb
```

There's a lot of failing tests, but don't be overwhelmed. Work through them one at a time.
