# Object Constructors

The previous lesson explained a bit about how JavaScript has no notion of classes.  To simulate the way that classes work, we can use a variety of techniques.  One of the common techniques is to use **constructor** functions.  There are lots of other ways to mimic class structures, but most of them are beyond the scope of this lesson.  [Douglas Crawford](http://javascript.crockford.com/) and the [Mozilla Developer Network](https://developer.mozilla.org/en-US/docs/JavaScript/) provide some good reading materials on the other techniques.

#### What is a constructor function?

A constructor function or object constructor can be thought of as a blueprint (similar to classes), or&mdash;better yet&mdash;as a casting mold from which new objects are minted.  The constructor function includes basic information about the properties of an object and uses a special syntax that allows us to build new objects quickly using the template defined by the constructor.

### Syntax for a Constructor

Let's utilize the example from the end of the last lesson and write a constructor function for `Person`.

```javascript
var Person = function(name) {
  this.name = name;
}
```

That's it.  Now we have a constructor, and can write code like `var pete = new Person("Pete Townshend");` to give us a new `Person` object.

In JavaScript, functions can also be declared using the following approach:

```javascript
function Person(name) {
  this.name = name;
}
```

For all intents and purposes, declaring the `Person` constructor this way achieves the same effect as in the previous example. _Out in the wild_, it's extremely common to see constructors declared in his fashion, so it's very important to be comfortable with this approach as well.  For the rest of our discussion, we will be using this approach for declaring constructors.


We will extend the constructor to set a `species` property as well.  We simply add another `this` statement to the function definition.  In a constructor, `this` is a keyword that stands for "the newly instantiated object".

```javascript
function Person(name) {
  this.name = name;
  this.species = "homo sapiens";
}
```

Looking at the code above, we notice three significant components that differentiate a constructor function from any other function:

1. Using `this` to define object properties
2. Parameters passed as values to corresponding object properties
3. Capitalized function name (this is just a convention, not a hard-and-fast rule)

Then, to generate a new object from a constructor, we use the syntax `new ConstructorName()`.

#### Compared to Ruby...

The same code in Ruby would look something like this:

```ruby
# Defining the class Person
class Person
  def initialize(name)
    @name = name
    @species = 'homo sapiens'
  end
end

# Creating a new instance of Person
pete = Person.new('Pete Townshend')
```

Not too different, right?  Let's use the `Die` example from Ruby Intro to explore the differences a bit more.

### The Die Constructor

Let's use the `Die` example from Ruby Intro to make a direct comparision between the two languages.  Type the JavaScript code into the browser console and try it out for yourself.

Defining a `Die` class in Ruby:

```ruby
class Die
  def roll
    # rand(6) returns one of 6 random integers, starting at 0
    # i.e., one of 0,1,2,3,4,5
    # So 1 + rand(6) returns a random integer form 1 to 6
    1 + rand(6)
  end
end
```

Defining a `Die` constructor function in JavaScript:

```javascript
function Die() {
  this.roll = function() {
    // Math.random() generates a float, so we use
    // Math.floor() to round down to the nearest integer
    return Math.floor(1 + Math.random() * 6);
  };
}
```

Run it in Ruby:

```ruby
die = Die.new

10.times do
  puts die.roll
end
```

Run it in JavaScript:

```javascript
var die = new Die();
var index = 0;

while (index < 10) {
  console.log(die.roll());
  index += 1;
}
```

This prints out `10` random integers between `1` and `6`, or `10` rolls of a six-sided die.

### Dissecting the Definition

Let's dissect the definition of our `Die` object constructor.

```javascript
// this says:
// "We're defining a new constructor function called Die"
function Die() {
  // this says:
  // "we're defining a new property 'roll' for each object created
  // from Die() and assigning it to a function"
  this.roll = function() {
    // This returns a random integer from 1 to 6
    // so our Die always acts like a six-sided die
    return Math.floor(1 + Math.random() * 6);
  };
}

```

Creating a new object from the `Die` constructor is done by calling `new Die()`.  In Ruby, we would say that we are *instantiating* a new object of the `Die` class.  These are similiar in the sense that both operations return a new object with the properties defined by the constructor/class.

### Multiple Rolls

What if we wanted to collect the results of multiple rolls into an `Array`?  We might write code like this:

```javascript
var multipleRolls = function(die, numRolls) {
  var rolls = [];
  var index = 0;

  while (index < numRolls) {
    rolls.push(die.roll());
    index += 1;
  }

  return rolls;
};

var die = new Die();

//This will return a 10-element array
//containing the roll results
console.log(multipleRolls(die, 10));
```

This code is "inside out."  A `Die` object should know how to roll itself multiple times.  That way anyone who has a `Die` object can take advantage of this functionality rather than requiring access to a `multipleRolls()` function defined somewhere else.

We do this by defining a new property for the `Die` constructor called `multipleRolls` and assign it to our function above.

```javascript
function Die() {
  this.roll = function() {
    return Math.floor(1 + Math.random() * 6);
  };

  this.multipleRolls = function(numRolls) {
    var rolls = [];
    var index = 0;

    while (index < numRolls) {
      rolls.push(die.roll());
      index += 1;
    }

    return rolls;
  };
};
```

Any new `Die` objects will now include the `multipleRolls()` function and can call it like this:

```javascript
// Create a new object
var die = new Die();

// Call the function multipleRolls() on the die object
die.multipleRolls(10);
```

#### this??

The logic is identical, but what's this `this.roll` business?

When you're inside the definition of object constructor the `this` keyword refers to "the current object," whatever that might be.  `this` is <strong>this</strong> object created from the `Die` constructor.  Many object-oriented languages use the `this` keyword, though Ruby uses `self` for the same concept.

The `this` keyword allows us to write functions that act like instance methods.

### References

[MDN: Global Object: constructor](https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects/Object/constructor)<br>
[Codecademy: Introduction to Objects I: Construction Junction](http://www.codecademy.com/courses/spencer-sandbox/3#!/exercises/0)
