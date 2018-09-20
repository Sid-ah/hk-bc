# Designing an Object's Interface

## Summary
Objects have internal data or state, which we refer to as the object's attributes (e.g., an age, a name, etc.).  And, we can create accessor methods that allow an object to share the values of its attributes or that allow an object to have its attributes overwritten (see [challenge][accessor challenge]).  How do we know if we should make an object's attributes readable, writable, or both?

A central component of good object-oriented design is understanding how much of an object to *expose*.  Exposing an object means making its attributes *public*—in other words, making the object's internal data available to other objects in our program.

As a general rule, we should only expose an object as much as is necessary for our application to function.  If our application can function without exposing an attribute, don't create the reader and writer methods.  In other words, we only write code that we need.  To explore this principle, let's build a `BankAccount` class that stores information about a bank account and selectively reveals some of it.


### Public and Private Interfaces
```ruby
aisha = Person.new(name: "Aisha", email: "aisha@domain.com")
# => #<Person:0x000001011f5638 @name="Aisha", @email="aisha@domain.com">
aisha.name
# => "Aisha"

"some string".reverse
# => "gnirts emos"
```  
*Figure 1*.  Calling methods on objects, using methods from their public interfaces.

We can think of methods to which an object responds as messages that it understands.  When we create a reader method that returns an object's name attribute, it's equivalent to being able to send the object a message asking for its name.  The same is true for any method that we call on an object—whether that's asking a person object for its name or asking a string to reverse itself (see Figure 1).

Together, all the messages we can send to the object make up the object's *public interface*.  This interface expresses to other developers using our code the behaviors they can expect to rely on—in other words, *what* our object does.  For example, ask a person object for its name, and it will return a string.

Objects can also have a *private interface*—methods accessible only within the object itself.  Private methods are important for *how* an object does what it does; they help an object carry out its responsibilities.  For example, we might create private methods as we refactor a public method, extracting some of its behavior into smaller, more-focused private methods.  

This [blog post][] provides a description of public and private methods, as well as a walk through for defining methods as private.


## Releases
### Release 0: Represent a Bank Account
```ruby
account = BankAccount.new("Junipero Serra", "Checking", "347-923-239")
# => #<BankAccount:0x0000010124d1f8 @customer_name="Junipero Serra", @type="Checking", @account_number="347-923-239">
```
*Figure 2*.  Instantiating a bank account object with a customer name, an account type, and an account number.

We'll begin by defining the class `BankAccount`.  As seen in Figure 1, we should be able to create a new instance of the class by supplying a customer name, an account type, and an account number.  These three pieces of data represent the internal state of an instance of our class.


### Release 1:  Accessor Methods
What do we want our `BankAccount` class's public interface to look like? How much of our object's internal state do we want to expose?  Do we want any of its attributes to be readable? What about writable?

Normally, we would let the needs of our application drive our decision making.  As this is a drill, let's make some reasoned speculative choices, and create any appropriate attribute accessor methods.

We might ask ourselves ... would we ever need to change the name associated with a bank account?  Would we change the type of an account?  Would we want to reveal an account number?  Think through whether we would want a reader and/or a writer method for each of our object's attributes.

Remember, our object's public interface defines what an object does, and we'll want to document that behavior in tests.


### Release 2:  Customized Readers and Writers
Standard reader methods will return the value of an attribute.  Writer methods will update the value of an attribute.  But, we can also customize accessor methods.

```ruby
account = BankAccount.new("Junipero Serra", "Checking", "347-923-239")
# => #<BankAccount:0x0000010124d1f8 @customer_name="Junipero Serra", @type="Checking", @account_number="347-923-239">
account.account_number
# => "***-***-239"
```
*Figure 3*. A customized reader method that hides part of an account number.

In our bank account example, we might have decided not to expose a bank account's account number.  However, we could also choose to expose the account number with part of it hidden (see Figure 3).

```ruby
account.customer_name = "JuNiPeRo D. sErRa"
account.customer_name
# => "JUNIPERO D. SERRA"
```
*Figure 4*. A customized writer method that converts a value to all caps before assigning it.

We might want to do something similar in a writer method.  We could choose that customer names should be stored in all caps.  If we then choose to make the customer name attribute writable, we might need to clean a new value before assigning it to our object (see Figure 4).

Let's modify our `BankAccount` class to have the behaviors described above.  As we're changing the behavior of our class, our tests will need to be updated to match.  


## Conclusion
We always want to be intentional in the design decisions that we make.  When we create a public interface for our objects, we're defining how other programmers will use the classes that we're creating, and once that interface is established, we won't want to change it without good reason.  

Consider what would happen if Ruby's `Array` class's interface changed, and the shovel operator (`<<`) was removed.  How many applications would break?  We write code expecting that the shovel operator will be there.  Similarly, as we begin writing code that other developers use, they will rely on the interfaces we create being stable.


[accessor challenge]: ../../../ruby-drill-accessor-methods-challenge
[blog post]: http://culttt.com/2015/06/03/the-difference-between-public-protected-and-private-methods-in-ruby/
