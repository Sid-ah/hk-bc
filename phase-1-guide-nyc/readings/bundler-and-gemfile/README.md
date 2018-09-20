#Bundler and Gemfiles
Written by [Torey Hickman](https://github.com/toreyhickman).

## Introduction

While writing classes and defining methods we have to decide how we intend for our class to interact with other objects?  What is the public interface of our class?  This might seem like an abstract concept at Dev Bootcamp where you and maybe three or four others are probably the only ones relying on your code.  But, what about for gems like [Nokogiri](http://rubygems.org/gems/nokogiri) with millions of users?  

The Nokogiri gem has been downloaded over 26 million times.  It has tens of millions of users that rely on it.  Changes to it's public interface—either the messages to which it responds (i.e., methods) or the values that they return—could cause problems for a lot of users.  

When we incorporate a library into our application, we create a dependency between our application and the library.  There is the expectation, as developers, that the library is going to be stable—the library's public interface forms a contract:  you can send me these messages, I'll return these values.  However, there's no guarantee that the interface will be stable, and sometimes a decision is made to change a public interface.

[Bundler](http://bundler.io/), itself a gem, helps to minimize the effects of any potential changes by giving us a way to define our applications environment.

## Gemfile

```ruby
# A sample Gemfile
source 'https://rubygems.org'

gem "rspec", "2.14"
```

*Figure 1.* Contents of `Gemfile` in the pig latin challenge.

You might have noticed a file in some of the challenge repos:  `Gemfile`.  Figure 1 shows the contents of the `Gemfile` from the [pig-latin-challenge repo](../../../../../pig-latin-challenge).  In the `Gemfile` are listed all of the gem dependencies for an application.  In this instance, there is only one dependency:  the `rspec` gem.  This `Gemfile` doesn't just list the gem dependency, however.  It also specifies which specific version of the gem to use:  2.14.  

We'll see `Gemfile` files with longer lists of gems and groups of gems for specific environments as we move through Dev Bootcamp.  For now, understand that Bundler makes use of the `Gemfile` to install all of our application's gem dependencies and to create the proper environment in which to run our application.

## `bundle install`

Bundler provides a simple way to install the gem dependencies for an application.  Within the application's root directory—where the `Gemfile` should be located—from the command line, type `bundle install`.  Alternatively, you can just type `bundle`.  Bundler will read through the `Gemfile` and check to see which gems have already been installed.  If any are missing, bundler will attempt to install them.  To do so, it needs to know where to find them.  In Figure 1, we can see that a source for the gems was specified:  `source 'https://rubygems.org'`; it's from this site that Bundler will attempt to install any missing gems.

Bundler will also install any dependencies of the gems specified in `Gemfile`.  While our project might only need `rspec`, `rspec` depends on other gems, which might themselves have additional dependencies.

## Gemfile.lock

```ruby
GEM
  remote: https://rubygems.org/
  specs:
    diff-lcs (1.2.5)
    rspec (2.14.0)
      rspec-core (~> 2.14.0)
      rspec-expectations (~> 2.14.0)
      rspec-mocks (~> 2.14.0)
    rspec-core (2.14.8)
    rspec-expectations (2.14.5)
      diff-lcs (>= 1.1.3, < 2.0)
    rspec-mocks (2.14.6)

PLATFORMS
  ruby

DEPENDENCIES
  rspec (= 2.14)
```

*Figure 2.*  `Gemfile.lock` created after running `bundle install` with `Gemfile` in Figure 1.

After Bundler has installed our gems and their dependencies, it will write a file `Gemfile.lock`.  Listed in `Gemfile.lock` are all of the gem dependencies used in this application and their specific versions (see Figure 2).  It's `Gemfile.lock` that allows us to set up the exact same environment on different computers.  When we run `bundle install` if Bundler sees the `Gemfile.lock` file, it will use this file to identify the specific versions of any gems that need to be installed.

The list of specific gem verstions in `Gemfile.lock` represents an environment in which our code is known to run.  Imagine if an update to a gem is released that changes the public interface.  It could potentially break our application.  However, if our application contains a `Gemfile.lock` that specifies using the older version of the gem, then we shouldn't need to worry about the change.  Anyone running our application will be able to set up the proper environment because `Gemfile.lock` specifies a version that works.

## `bundle exec`

Once we've created our `Gemfile` and run `bundle install` getting `Gemfile.lock`, we can then provide access to the gems by prefacing our commands with `bundle exec`.  If we wanted to run a Ruby script from the command line, we would run `bundle exec ruby my_file.rb`.  If we wanted to execute a Rake task, we would run `bundle exec rake my_task`.  This is particularly important if our system has multiple versions of the same gem installed; we'll want to be sure that we're incorporating the working version.

## Conclusion

As we move forward throughout Dev Bootcamp, we'll begin to explore new gems and incorporate them into our applications.  We'll want to remain mindful that the applications we write and the applications from other developers that we run have specific dependencies that are required for them to run properly.  A `Gemfile` and Bundler can help us to manage these dependencies, so that the software runs as indended.


