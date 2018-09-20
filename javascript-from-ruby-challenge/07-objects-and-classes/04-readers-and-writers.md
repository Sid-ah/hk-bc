# Readers and Writers

In Ruby Intro, we noted that one of the most common requirements of a class is that the outside world be able to read and possibly write to its instance variables.  Since instance variables are only accessible by instance methods by default, and not the outside world, we have to define **reader** (getter) and **writer** (setter) methods which expose an object's instance variables.

This lesson will show a direct comparison between reader and writer methods in Ruby and how we would write them in JavaScript.

### The Person Constructor

Here is a Ruby `Person` class with no readers or writers:

```ruby
class Person
  def initialize(full_name, age)
    @full_name = name
    @age  = age
  end
end
```

And the same thing in JavaScript, using a constructor function:

```javascript
function Person(fullName, age) {
  var fullName = fullName;
  var age      = age;
}
```

What happens if we try to access a `Person`'s name or age?

In Ruby, we would get an error `NoMethodError`:

```ruby
nancy = Person.new('Nancy', 'Drew')
puts nancy.first_name
```

In JavaScript, it simply returns `undefined`:

```javascript
var nancy = new Person('Nancy Drew', 82);
console.log(nancy.fullName); // => undefined
```

### Our First Reader

In Ruby, a reader method for is defined thusly:

```ruby
class Person
  def initialize(name, age)
    @name = name
    @age  = age
  end

  def name
    @name
  end
end
```

Which means that we can now read the value stored in `@name`:

```ruby
nancy = Person.new('Nancy Drew', 82)
puts nancy.name # => 'Nancy Drew'
```

Creating a reader method in JavaScript requires defining a function that returns the value of the instance variable and assigning it to a property of the object.

```javascript
function Person(fullName, age) {
  var fullName  = fullName;
  var age       = age;

  // Don't forget about the return keyword!
  this.fullName = function() { return fullName };
}

var nancy = new Person('Nancy Drew', 82);
console.log(nancy.fullName());
// Note the use of parens to execute the function
```

We can simplify the code, achieving the same result by removing the local variables, and simply relying on the parameter variable, `fullName` and `age`.  Just like local vars, the values of parameters exist in their local context.

```javascript
function Person(fullName, age) {
  // Don't forget about the return keyword!
  this.fullName = function() { return fullName };
}
```

Nonetheless, you may be saying to yourself, "that seems like an awful lot of code to just return a value stored in an object.  Why can't we just use a property that is assigned to the parameter `fullName`?"  This is a very good question.  Let's see what happens if we do precisely that:

```javascript
function Person(fullName, age) {
  this.fullName = fullName;
}

var nancy = new Person('Nancy Drew', 82);
console.log(nancy.fullName);
```

Works like a charm, right?  Except for one significant caveat: object properties can be re-assigned:

```javascript
nancy.fullName; // => "Nancy Drew"
nancy.fullName = "Tom Sawyer";
nancy.fullname; // => "Tom Sawyer"
```

The entire purpose of a reader method is to allow us to read data stored within an object *without being able to write to it*.  The statement `nancy.fullName = "Tom Sawyer;"` re-assigned the `fullName` *property* of `nancy`, but it didn't actually change the variable `fullName`.  So now `nancy` has two separate names: the `fullName` variable, internal to the object, and the `fullName` property, which can be read and written to as we see fit.

This is not a good design for a reader method. It's much better to use the first example: `this.fullName = function() { return fullName };`, which is a true reader method in the sense that it returns some value of the object without exposing that value to manipulation.

### Our First Writer

Writer methods in Ruby are a simple matter of re-assigning the value of an instance variable:

```ruby
class Person
  def initialize(name, age)
    @name = name
    @age  = age
  end

  def name=(new_name)
    @name = new_name
  end
end

nancy = Person.new('Nancy Drew', 82)
nancy.name = 'Tom Sawyer'
nancy.name # => 'Tom Sawyer'
```

In JavaScript, a writer function looks similar:

```javascript
function Person(fullName, age) {

  this.fullName = function(newName) {
    fullName = newName;
  };
}

var nancy = new Person('Nancy Drew', 82);
nancy.fullName('Tom Sawyer');
```

If we want to check that it really works, we'll need a reader method as well.  In Ruby, we can distinguish a reader method from a writer method by defining the writer with an equals `=` in the name `def name=(new_name)`, but this is not allowed in JavaScript.  For clarity's sake, we should name our two functions differently:

```javascript
function Person(fullName, age) {
  // Getter function
  this.getName = function() {
    return fullName;
  };

  // Setter function
  this.setName  = function(newName) {
    fullName = newName;
  };
}

var nancy = new Person('Nancy Drew', 82);
nancy.getName(); // => 'Nancy Drew'
nancy.setName('Tom Sawyer');
nancy.getName(); // => 'Tom Sawyer'
```

There we go!  By defining reader (getter) and writer (setter) functions like this, we can let the outside world interact with our object's internal data (i.e., its _instance variables).

### Variables vs. Properties Redux

If we define getter and setter functions for a local variable, what is the difference between that and a property defined with the `this` keyword?

```javascript
function Person(fullName, age) {
  this.fullName = fullName;
  this.age      = age;
}
```

With the above `Person` constructor, any new person object created will have two properties: `fullName` and `age`, and both can be read from and written to at will.  In other words, these properties are functionally the same as having a local variable that is exposed via a getter and setter function.

In Ruby, we could just include `attr_accessor :full_name` and `attr_accessor :age` in the `Person` class.  In JavaScript, we can use object properties.

Since properties are not variables, we can't reference them like local variables.  They must always be referenced in relation to their parent object, which in the definition is represented by the `this` keyword.  Writing a function that adds one year to a person's age looks like this:

```javascript
function Person(fullName, age) {
  this.fullName = fullName;
  this.age      = age;

  this.growUp   = function() {
    this.age += 1;
  };
}
```

According to the basic tenets of object-oriented programming, it is best to only expose the minimum surface area for any object.  That is, an object should not define properties for things that really should be private, internal local variables.  Making that decision is part of your job as a programmer.

### References

[Codecademy: Review of Object-Oriented Programming: Section 3 - Privacy](http://www.codecademy.com/courses/intro-to-object-oriented-programming/2#!/exercises/0)
