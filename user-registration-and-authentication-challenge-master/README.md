# User Registration and Authentication

## Summary
In this challenge we're going to explore user registration and authentication.  To begin, our application will be limited to allowing users to register for our site and afterward login and logout.  Once our application has this functionality, we'll look at authorization—allowing logged in users access to content that guests cannot access.


### Working with Sessions
HTTP is a [stateless protocol][], meaning that HTTP servers "forget" everything they know about a client between each request-response cycle.  Servers don't remember which clients made which requests or to whom they've sent which responses.  
 
But, we know that if we log into a website, the application continues to remember that we're logged in as we visit various pages on the site.  In other words, our logged-in state is preserved across multiple requests.  How does this happen?
 
In this challenge, we'll learn to track whether or not a user is logged in using [sessions][] in Sinatra. Sessions contain data from the server that is encrypted and stored in HTTP cookies.  Since cookies are sent back and forth between browser and server, the session cookie is always available to us in Sinatra.


### Protecting User Data with BCrypt
When users register with our application, they trust us with their data:  names, e-mail addresses, passwords, etc.  We must do everything we can to protect our users in case our database is compromised.  To that end, we should never store a user's plain-text password in our database.

But that does raise a problem.  Users register for our site with an e-mail address and a password.  We can't save that password.  But, when users return to the site and log in, we have to check that they enter the correct password.  How do we do that?

Instead of storing the password itself, we can store a transformed version of it.  One option is to run the password through a [hashing algorithm](https://en.wikipedia.org/wiki/Cryptographic_hash_function) and then store the hashed version in our database.  One such hashing algorithm is [bcrypt](https://en.wikipedia.org/wiki/Bcrypt), for which there is a [Ruby gem](https://github.com/codahale/bcrypt-ruby).  Figure 1 shows an example of using the gem to create a hashed version of a string.

```ruby
require 'bcrypt'

hashed_password = BCrypt::Password.create("password")
# => "$2a$10$KncjtgHorSeQcQyzOQjKVOWS6/nhjGo8vuvbb4H54QyuC41c10DQ6"
```  
*Figure 1*.  Using the BCrypt gem to hash a password.


Saving the hashed password in the database means that we can avoid storing plain-text passwords.  But if all we save is the hashed password, how do we check whether the user logs in with the correct plain-text password?  We check whether that plain-text password is the same as the string originally used to create the hashed password.  

The hashed password is made up of two parts:  the first part is the *salt* and the second part is the *checksum* (see Figure 2).  The bcrypt hashing algorithm used that salt to transform the original plain-text password into the checksum.  To check whether a user logs in with the correct plain-text password, we give the hashing algorithm both the salt from the already hashed password and the plain-text log-in password, and we see whether the algorithm produces the same result.  The [`#==`][bcrypt password equality] method in the [`BCrypt::Password`][bcrypt password] class will perform this check for us, determing whether a hashed password was made from a given string (see Figure 3).

```ruby
hashed_password
# => "$2a$10$KncjtgHorSeQcQyzOQjKVOWS6/nhjGo8vuvbb4H54QyuC41c10DQ6"
hashed_password.salt
# => "$2a$10$KncjtgHorSeQcQyzOQjKVO"
hashed_password.checksum
# => "WS6/nhjGo8vuvbb4H54QyuC41c10DQ6"
```
*Figure 2*.  Accessing a `BCrypt::Password` object's salt and checksum values.

<br>

```ruby
hashed_password == "my secret"
# => false
hashed_password == "password"
# => true
```  
*Figure 3*.  Determining whether a hashed password was made from a particular string.

*Note:*  For more information on writing custom operator methods like the `#==` method in the `BCrypt::Password` class, see the [rational numbers stretch challenge][rational numbers].


## Releases
### Release 0:  Implement User Registration
The first feature that we'll build out is user registration.  When users visit our site, they should be able to create new accounts by submitting some basic information:

- full name
- e-mail address
- password

When users register with our site, we'll need to persist the information they provided in the database (i.e., save the new user).  What data should we store?  How should we store it?  Remember, we should not store a user's plain-text password.  What constraints should we have in our database? What validations on our models?  What would happen if two users registered with the same e-mail address?  Or, if a user did not supply an e-mail address?

*Note:*  When users later return to our site and attempt to login, they will submit an email address and password.


### Release 1:  Implement User Login
If users register with our site, they'll need to be able to log into their accounts.  Specifically, we'll ask users to log in with their e-mail addresses and passwords.  How will our application determine whether or not the user supplied a correct e-mail and password combination?  Where should that responsibility live?

We'll give that responsibility to the `User` model by defining an `.authenticate` class method.  The method will accept two arguments—an e-mail address and a password—and attempt to find a user with those credentials.  We'll need to implement this method ourselves, but Figure 4 provides some shell code and pseudocode.

```ruby
class User < ActiveRecord::Base
  # e.g., User.authenticate('jesse@devbootcamp.com', 'apples123')
  def self.authenticate(email, password)
    # if email and password correspond to a valid user, return that user
    # otherwise, return nil
  end
end
```
*Figure 4*.  Shell code for an authenticate method.


Once our authenticate method is working, let's add the log-in feature to our application.  Users should submit their login credentials in a POST request to a `/login` URL.  If the user sends a valid email and password combination, we'll log the user in.  We'll "remember" that the user is logged in by storing data in the `session` hash.  Read the [using sessions section][using sessions] of the Sinatra documentation, if working with the `ssession` hash is unclear.  If it is still unclear after reading the documentation, ask for help from a staff member.


### Release 2:  Implement Logging Out
If users can log in, they'll also need to log out.  So, let's build a log out feature.  Add a route to the application that allows users to log out.  What does the route handler need to do to log the user out?  How did we track that a user was logged in?  What would we need to change for the user to not be logged in?  Could we delete some content from the `session` hash?


### Release 3:  Implement Authorization
To this point, we've been dealing with *authentication*:  answering the question, "Who are you?"  Now we're going to handle *authorization*:  answering the question, "What do you have permission to do?"

In applications there are different use cases for authorization.  For example, an application might have a group of administrators with special privileges:  editing content, deleting posts, etc.  In our application, we'll authorize all logged-in users to view the content of our site.  If users have not logged in, they will not be authorized to view the content.

What is our content?  We're practicing authorization, so let's just create a "secret" page.  Users should be authorized to see the secret page only if they're logged in.  If users try to access the secret page when they're not logged in, they should be redirected to the login page.

One way to restrict access to authorized users is a [before filter][].  This not the only way to accomplish this and not necessarily the best way in this case.  But it's one tool to implement this kind of pre-route logic.  For an application this simple, it's ok to put the authorization logic in the route handler itself.


## Conclusion
Think about the apps we use everyday:  Twitter, Instagram, GitHub, etc.  User registration, authentication, and authorization are key aspects in these applications.  These are skills that we must have.  We've gotten an introduction to these concepts in this challenge.  Moving forward at Dev Bootcamp we'll receive more practice with them as we'll continue building user authentication into our applications.

[bcrypt password]: https://github.com/codahale/bcrypt-ruby/blob/master/lib/bcrypt/password.rb
[bcrypt password equality]: https://github.com/codahale/bcrypt-ruby/blob/master/lib/bcrypt/password.rb#L65
[sessions]: http://www.sinatrarb.com/faq.html#sessions
[using sessions]: http://www.sinatrarb.com/intro#Using%20Sessions
[before filter]: http://www.sinatrarb.com/intro#Filters
[rational numbers]: ../../../the-rational-numbers-challenge
[stateless protocol]: https://en.wikipedia.org/wiki/Stateless_protocol
