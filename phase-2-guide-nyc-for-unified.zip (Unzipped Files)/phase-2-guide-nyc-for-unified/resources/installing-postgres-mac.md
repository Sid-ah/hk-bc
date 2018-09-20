# Setting up PostgreSQL on your Mac for use with Ruby

## Summary
This is a guide for setting up postgresql on Mac OS X for use with Ruby/Sinatra/Rails/etc. (Written for students at Dev Bootcamp Chicago). We will set up a PostgreSQL server on your local machine, get it running automatically in the background, and install the `pg` Ruby gem.

## Contribution guidelines
If you have any corrections, tips, or ideas to add, feel free to submit a pull request.

## Guide
### Step 1: Install Homebrew
Homebrew is a package manager that will help you install developer tools on your Mac. The `pg` Ruby gem depends on PostgreSQL being installed natively on your computer, so we need to do that outside of Ruby first. (Once you do this you will be able to use PostgreSQL in any context, not just Ruby.)

1. Open a terminal window and check if homebrew is installed by running the command `brew help`
2. If it is installed (you see a bunch of output), run `brew update` to make sure everything is up to date.
3. If it is not installed (you see "command not found"), follow the installation instructions at [http://brew.sh](http://brew.sh)

### Step 2: Install Homebrew's Services Tool
Homebrew Services will allow you to run anything in the background and launch it at startup. To install this tool, run the command:

`brew tap homebrew/services`

### Step 3: Use Homebrew to Install PostgreSQL Natively
Now we need to install the PostgreSQL server itself. Homebrew will make this easy. Run the command:

`brew install postgresql`

### Step 4: Register PostgreSQL as a Service
Now that we have PostgreSQL, we'll use homebrew services to run in the background and have it launch automatically at startup. Run the command:

`brew services start postgresql`

### Step 5: Ruby Time
We should now have a PostgreSQL server running on our machine. Woot! Now let's hook it up to Ruby. I am assuming that you already have a Ruby project that uses bundler and has an entry in the gemfile for `pg` (which is the Postgres adapter for Ruby.) Now you can `cd` to your project directory and run `bundle install` -- you should be all set and ready to go! Assuming you have a Rakefile set up for this (all DBC projects do), you can run `bundle exec rake db:create` to test it out.

It is not uncommon for the `bundle install` to fail when installing something like `pg` with "native extensions". If the `bundle install` fails, your first attempt should be to delete the file `Gemfile.lock` and run `bundle install` again.

Yay!
```
UPDATE feelings
SET type="relief"
WHERE origin="system setup";
```

**Go get codin'!**

![Steven Excited](https://media.giphy.com/media/Tld8USHlpopYA/giphy.gif)
