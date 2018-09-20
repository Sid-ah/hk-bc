# Ruby Drill: The Self Keyword

## Summary
There is a keyword in Ruby called `self`. We're going to explore `self` in this challenge.  It can be difficult to understand the `self` keyword, but our understanding of it will grow as we become more practiced rubyists.

```ruby
name = "Malachi"
# => "Malachi"
name.upcase
# => "MALACHI"
```
*Figure 1*. Calling a method on an specific object, referenced through a variable.

We're used to defining variables in our programs.  When we assign an object to a variable, we can later reference the object through the variable (see Figure 1).  The `self` keyword works similarly to a variable in that it also references an object.  However, the object to which `self` points changes at different points in our program.

To which object does `self` point?  Remember, when we call a method, we're sending a message to an object.  In Figure 1, when we call `name.upcase`, we're sending the message `:upcase` to a specific object, a string that we're referencing through the variable `name`.

```ruby
object_id
# => 2155958780
```
*Figure 2*.  Calling the `:object_id` method without explicitly stating which object should receive the message.

However, we sometimes call a method without calling it directly on an object.  In Figure 2, we call the `:object_id` method, but we don't explicitly state to which object we're sending the message.  So, to which object is this message sent?  The message is sent to the object to which `self` points.  In other words, when we call a method, `self` is the default receiver.

In the *Releases* section we'll explore to which object `self` refers at different contexts of our program, and how we can utilize it.


## Releases
### Release 0: Within Method Definitions
When we define methods, we're writing code that will be executed at a later time when the method is called.  In addition, the method executes in a new context, or scope.  While the code in the method body is executing in this new scope, `self` refers to the receiver of the method call (i.e., the object on which the method was called).

We have a class `Person` with instance methods that demonstrate this (see `person.rb`).  First, there is the method `#return_self`, which simply returns the object to which `self` points when the method executes.  The test suite demonstrates that this method returns the exact same object on which the method was called; run the tests for class `Person`.

Second, we have the method `#full_name`, which combines and returns the person's first and last names.  We can see that the method calls the `#first_name` and `#last_name` attribute reader methods on `self`, which is the object on which the method is called.

```ruby
class Person
  def full_name
    "#{first_name} #{last_name}"
  end
  
  # Rest of class omitted ...
end
```
*Figure 3*. Using `self` as the default receiver of method calls.

Remember that `self` is the default receiver of method calls.  If we call a method without specifying an object on which we're calling the method, the message is sent to `self`.  To demonstrate this, refactor the `#full_name` method to match Figure 3—we're removing the explicit receiver from our method calls.  The method will behave just as it did before, and our tests will continue to pass.

Open IRB and `load 'person.rb'`.  With the file loaded, we can create some instances of the class `Person` and call the `#return_self` and `#full_name` methods on them.  Notice how the return values of the methods differ—all because the value of `self` is different depending on which object the method is called.


### Release 1: When Defining a Class
When we define a class, that class is itself an object.  Like any other object, a `Class` object is capable of having messages sent to it.  We regularly send them the message `:new`.

Sometimes we want our classes to perform additional behaviors.  To accomplish this, we can define methods on a class itself.  We call these *class methods*.  We have a class object `Dog` that has a class method defined on it: the method `.create_multiple` which creates multiple dogs based on an array of data.  See the code in file `dog.rb` and run the tests for the class `Dog`.

```ruby
class Dog
  def Dog.create_multiple(data_for_multiple_dogs)
    data_for_multiple_dogs.map { |data_for_one_dog| Dog.new(data_for_one_dog) }
  end
  
  # Rest of class omitted ...
end
```
*Figure 4*.  Defining a class method within the body of the class definition.

What does this have to do with the keyword `self`?  To set up for that discussion, we're going to do a little refactoring.  When we define a class method, we typically do so within the body of the class definition; this keeps our code well organized.  Refactor our `Dog` class so that the class method `.create_multiple` is defined within the class definition (see Figure 4).  Our tests for the `Dog` class should continue to pass.

Now that we're defining our class method within the body of the class definition, we can discuss `self`.  When Ruby encounters a class definition, the code in the class definition is executed, and while it's executed the `self` keyword will point to the `Class` object being defined.

```ruby
class Dog
  def self.create_multiple(data_for_multiple_dogs)
    data_for_multiple_dogs.map { |data_for_one_dog| Dog.new(data_for_one_dog) }
  end
  
  # Rest of class omitted ...
end
```
*Figure 5*.  Defining a class method within the body of the class definition, using the keyword `self`.

To demonstrate this, perform an additional refactor.  Rather than defining the class method `.create_multiple` explicitly on the object `Dog`, define it on `self` (see Figure 5).  As with our previous refactor, our tests should continue to pass.  After all, in this example, `self` is pointing to the object `Dog`.


### Release 2:  When Defining a Module
```ruby
Math.sqrt(4)
# => 2.0
Math.hypot(3, 4)
# => 5.0 
```  
*Figure 6*. Calculating using the `Math` module.

Modules in Ruby are used in different ways.  One way to utilize a module is as an object that performs a set of related behaviors.  For example, Ruby provides a `Math` module.  In Figure 6, we can see that we can call methods directly on the module itself.  We can ask the `Math` module to calculate the square root of a number or the length of a triangle's hypotenuse given the lengths of its legs.

We're going to define our own module `AreaCalculator` which will calculate the areas of shapes.  Tests are written for the module's behaviors; we need to define the methods.  If our geometry is rusty, we can see how to calculate each shape's area in the tests; this release isn't about geometry, rather it's about using `self` within the body of a module definition.

We define modules in the same way that we define classes—in fact, a class is a specific type of module.  Only, instead of beginning with the keyword `class`, we begin with `module`.  As with defining a class, when we define a module we're creating an object on which we can define methods (i.e., add behaviors).

`self` is treated the same way in the body of a module definition as it is in a class definition.  `self` points to the module being defined.  So, as we're defining a module, we can utilize `self` to add methods to the module, just as we did in adding the method `.create_multiple` to our `Dog` class in *Release 1*.

Add some behaviors to the module object `AreaCalculator`.  Again, the behaviors we're looking for have been described in the test suite:  calculating the area of rectangles, squares, and triangles.


### Release 3: The Global Context
Take a look at the file `runner.rb`.  In the file, we define a method `#return_self` that returns the value of `self`. We know from *Release 0* that `self` will reference the object on which the method is called.  After defining the method, we call the `#puts` method, passing in an interpolated string in which we call our `#return_self` method.

When we call these methods, we don't specify a receiver, but the messages need to be sent to some object. With no explicit receiver, they'll go to the default receiver, which we know is `self`.  Which object receives these method calls?  Run the runner file to find out.

There is a global context in which our Ruby programs execute, and within this context exists a special instance of the class `Object` called `main`.  And, in the global context, `self` points to `main`.  We won't commonly utilize `self` in the global context, but it's good to be aware of what's happening when we call methods in the global context without specifying a receiver.


### Release 4: `self` Reflection
After reading and working through *Releases 0 - 3* and working with `self`, we should have some understanding of it.  Write up an explanation of `self` in the file `self_reflection.md`.  As much as possible, put our description of `self` in our own words, such that a non-technical person could understand.


## Conclusion
We'll most commonly use `self` to define class methods when defining a new class—or defining methods on a module.  Going back to *Release 1* and *Release 2*, it's important to understand that when the code in a class/module definition is executed, the value of `self` is that new class or module that we're defining.

We'll also want to be sure that we understand that `self` is the default receiver of method calls.  When we define methods we often call other methods within the method definition without explicitly naming a receiver.  We should understand that when such method are executed, method calls without an explicit receiver are sent to the object to which `self` refers, the object on which we called the original method.


[self article]: http://yugui.jp/articles/846

