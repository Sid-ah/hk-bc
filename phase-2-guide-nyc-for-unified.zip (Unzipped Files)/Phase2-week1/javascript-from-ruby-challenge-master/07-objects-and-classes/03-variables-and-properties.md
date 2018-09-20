# Variables and Properties

We've done three things so far:

1. Defined constructors and objects
2. Defined our own `Die` constructor with a single property, the function `roll()`
3. Extended our `Die` constructor to allow for multiple rolls using the `this` keyword

When we defined objects we said they were a collection of data and functions that act on that data, but we haven't really explored the `this` keyword in relation to the `var` keyword when it comes to storing data about an object.

All of the object properties we've defined have been public &mdash; they can be called on an object and will return some data or execute some code.  If this were Ruby, we would have only covered the methods of an object.  What about things like instance variables, which hold private data stored within an object?

### Show Me the Data!

To begin, let's rebuild our `Die` constructor again so we can create dice with any number of sides, not just six.

```javascript
function Die(numSides) {
  var sides = numSides;

  this.roll = function() {
    return Math.floor(1 + Math.random() * sides);
  };
}
```

Take note of the `var sides` statement: we didn't use the `this` keyword here.  This means that `sides` is not a *property* of `Die`, but is rather an local variable for `Die` objects.  In Ruby, this is an *instance variable*.

Since the constructor function takes an argument `numSides`, we can create new `Die` objects with any number of sides, and that number will be stored in the local variable `sides`.  However, `sides` is **not a property**: its value is private to the object itself.

You want proof?  Stick this in your browser console:

```javascript
var sixDie    = new Die(6);
var twentyDie = new Die(20);

// They both have a roll function:
console.log(sixDie.roll());
console.log(twentyDie.roll());

// But what if you try to find out the number of sides?
console.log(sixDie.sides);
console.log(twentyDie.sides);
```

`undefined`.  When you try access a property of an object that does not exist, JavaScript will give you `undefined`.  This is its way of respecting the privacy of an object.  It is saying "you're on a need-to-know basis with this object, and you don't need to know".

### How is this like Ruby?

Ruby uses instance variables and defines an `initialize` method.  JavaScript defines local variables for an object and provides parameters in a constructor function.

In Ruby, the equivalent to the above `Die` constructor would be written like this:

```ruby
class Die
  def initialize(num_sides)
    @sides = num_sides
  end

  def roll
    1 + rand(@sides)
  end
end
```

You could say that a object constructor functions in JavaScript are akin to a the `initialize` method, in the sense that both take arguments which determine the data stored within the new object.  The `Die.new(6)` method in Ruby and the `new Die(6);` syntax in JavaScript do look and feel very similar.  But where Ruby distinguishes between an `initialize` method and a `class` definition, JavaScript wraps it all up in the object constructor syntax.

### Variable Scope

Ruby also distinguishes between instance variables (`@sides`) and local variables.  JavaScript does not, but we can still create clear object-oriented programs using the notion of *variable scope*, which dictates that variables defined within functions are only accessible within that function itself.

Here is an example:

```javascript
var foo = "goobers";

function Bar() {
  var baz = "zoomzapzippy";
}

console.log(foo); // => "goobers"
console.log(Bar); // => function () {...}
console.log(baz); // => ReferenceError: baz is not defined
```

The variable `foo` is defined in the *global scope*: the main body of our program.  Therefore, when we call the function `console.log(foo)` in the global scope, it prints the value of `foo`.  Likewise with `Bar`, though in this case it is a function.

`baz` is defined within the function `Bar()`, which means that it is a local variable of `Bar()`.  If we try to access it from the global scope, we get an error.

In Ruby, local variables are visible only within the method where they were defined.  Methods can't access local variables defined elsewhere and other parts of the program can't access local variables defined in a method unless they were passed in as an argument.  The same statement applies to JavaScript, if you swap out `method` and replace it with `function`.

### Many-Sided Die, Again

Back to our `Die` constructor, now with commentary about the varaible scope:

```javascript
// The parameter ~numSides~ allows the Die constructor
// to accept the number of sides as an argument
function Die(numSides) {

  // ~sides~ is a local variable within the scope of the
  // Die constructor function that gets assigned to the
  // argument passed in when a new object is created.
  var sides = numSides;

  // Other variables and properties of the Die function
  // have access to the ~sides~ variable since they are
  // defined within the same scope
  this.roll = function() {
    return Math.floor(1 + Math.random() * sides);
  };
}

// When we create a new Die object
var tenDie = new Die(10);
// We have access to the properties defined by Die
tenDie.roll(); // => random number between 1 and 10
// ...but not to the local variables defined within Die
tenDie.sides; // => undefined
```

### References

[MDN: Details of the Object Model: Object Properties](https://developer.mozilla.org/en-US/docs/JavaScript/Guide/Details_of_the_Object_Model#Object_properties)
