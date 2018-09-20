# Inheritance

We already noted that JavaScript is prototype-based, not class-based.  To get a sense of what this means, take a look at this [chart comparing class-based and prototype-based languages](https://developer.mozilla.org/en-US/docs/JavaScript/Guide/Details_of_the_Object_Model#Summary_of_differences).

Everything in JavaScript is an object.  Each object is connected to it's prototype object, which is akin to a parent class in Ruby.

>When it comes to inheritance, JavaScript only has one construct which is objects. An object has an internal link to another object (or null) called its prototype. This object has a prototype as well and so on, until one object has null as its prototype. This chain of objects being prototypes of one another is called the prototype chain. [Link to source](https://developer.mozilla.org/en-US/docs/JavaScript/Guide/Inheritance_and_the_prototype_chain)

Let's review how inheritance works in Ruby before exploring prototypal inheritance in JavaScript.

### Inheritance in Ruby

There are a lot of different ways that inheritance works in Ruby.  One feature we can use is the ability to extend a class with new methods and instance variables.  Let's use a new `Flower` class for this experiment:

```ruby
class Flower
  attr_reader :common_name, :latin_name

  def initialize(common_name, latin_name)
    @common_name = common_name
    @latin_name  = latin_name
  end
end
```

Now that we have a `Flower` class with two instance variables and associated reader methods, we can create new instances:

```ruby
tiger_lily = Flower.new("Tiger Lily", "Lilium columbianum")
tiger_lily.common_name # => "Tiger Lily"
tiger_lily.latin_name # => "Lilium columbianum"
```

All working as expected.  Now, let's introduce a new feature: we want to be able to store information about the native geographic range of a given species.  We want an API like this:

```ruby
tiger_lily.region = "North America"
tiger_lily.region # => "North America"
```

In its current definition, the `Flower` class does not have a `region` reader or writer method.  So the above code would error out.

The remedy is to *extend* the class by simply opening it up again with the `class` keyword and adding in the new code:

```ruby
class Flower
  attr_accessor :region
end

tiger_lily.region = "California, the Northwestern United States, and Canada"
tiger_lily.region # => "California, the Northwestern United States, and Canada"
```

Even though the instance `tiger_lily` was created from the original definition of the `Flower` class, it *inherited* the new `region` methods added in the extension.  This is the magic of inheritance in action.  All instances of a class inherit from the class, even when that class is extended and new functionality is added.

### Extending the Prototype

Inheritance in JavaScript is a distinctly different animal.  We will cover the basics of prototypal inheritance in the remainder of this lesson, but you will have to do some further reading to truly understand the subtleties and nuances of inheritance.  The references provided at the bottom of the page are a good place to start.

First, let's replicate the `Flower` example above.  Here is the equivalent constructor function for the `Flower` class:

```javascript
function Flower(commonName, latinName) {
  // Define some getter methods
  this.getCommonName  = function() { return commonName };
  this.getLatinName   = function() { return latinName  };
}
```

Copy the above code into your browser console so that you can create your own `Flower` objects.

Next, let's create a new instance and make sure all is in working order:

```javascript
var tigerLily = new Flower("Tiger Lily", "Lilium columbianum");
tigerLily.getCommonName();
tigerLily.getLatinName();
```

Now we are faced with extending `Flower` to include a `region` attribute, which we could store as a local variable.  We need to define a new getter and setter function for `Flower`, but we want to do so in such a way that our already-created instance `tigerLily` has access to them.

In Ruby, we can open up a class and simply drop in more code for that class.  In JavaScript, we assign new properties to the object's `prototype`.  Let's start by creating the `region` property:

```javascript
Flower.prototype.region = "default region";
```

Now all instances of `Flower` have a `region` property set to a default value.  Let's override the default for `tigerLily`:

```javascript
tigerLily.region = "California, the Northwestern United States, and Canada";
```

This is not quite the same thing as in Ruby, since we didn't define a new variable, just a new property.  If we want to define other methods that use `region`, we'd have to refer to in as a property, not a variable:

```javascript
Flower.prototype.goExtinct = function() {
  this.region = null;
};
```

### The Prototype Chain

In Ruby, instances of a class inherit from that class.  It is also true that classes inherit from parent classes, e.g. `Fixnum` inherits from `Integer`, which inherits from `Numeric`, which inherits from `Object`, and so on, all the way to `nil`.

Setting up class inheritance structures in Ruby looks like this:

```ruby
class Flower
  # Parent class
end

class Orchid < Flower
  # Child class
end

f = Flower.new
b = Orchid.new

f.class.superclass # => Object
b.class.superclass # => Flower
```

The equivalent feature in JavaScript is the **prototype chain**, though there is no singular way to set up inheritance structures.  Instead, there are all kinds of techniques and design patterns&mdash;some better than others&mdash;that utilize the prototype feature of JavaScript to construct an architecture of inheritance.

There is a great deal of debate as to which design pattern is the best, so instead of taking sides, we will show two of the more popular way.  [The inheritance page](https://developer.mozilla.org/en-US/docs/JavaScript/Guide/Inheritance_and_the_prototype_chain#Different_ways_to_create_objects_and_the_resulting_prototype_chain) on the Mozilla Developer Network provides a good general overview of the ways that inheritance.

#### Constructor Inheritance

Let's re-create the `Orchid < Flower` relationship above (with some enhancements) using JavaScript constructors to build a prototype chain:

```javascript
function Flower(family) {
  this.kingdom   = 'Plantae';
  this.division  = 'Angiospermae';
  this.getFamily = function() { return family };
}

function Orchid(name, isEpiphyte) {
  this.isEpiphyte = isEpiphyte;
  this.getName    = function() { return name };
}

Orchid.prototype = new Flower("Orchidaceae");
```

So, what is going on here?  Well, we have two constructor functions: `Flower()`, which forms the base of our inheritance tree, and `Orchid()`.

`Flower` takes one argument and stores it in its parameter variable `family`.  It also defines three properties, one of which is a getter method `getFamily`.

`Orchid` takes two arguments, storing one in its parameter variable, and the other in a property.  It also defines a getter method to access the `name` variable.

The last statement is where the magic happens.  By assigning an instance of `Flower` to the prototype for `Orchid`, we have determined that any instances of `Orchid` will inherit the properties and methods of `Flower`:

```javascript
// Create a new Orchid object
var vanilla = new Orchid("Vanilla planifolia", false);

// isEpiphyte and getName are defined by the Orchid constructor
console.log(vanilla.isEpiphyte);
console.log(vanilla.getName());

// kingdom, division, and getFamily are all properties of Flower
console.log(vanilla.kingdom);
console.log(vanilla.division);
console.log(vanilla.getFamily());
```

When accessing a property or calling a method on an object, JavaScript looks up the prototype chain.  In other words, if the property or method is not defined by the object itself, JavaScript looks for it within the object constructor.  Then, if the property or method is not defined, JavaScript will look for it in the prototype object, and will keep looking all the way up the chain until it finds it.

If the property is not defined anywhere in the prototype chain, then JavaScript returns `undefined`.  If you call a method that cannot be found in the prototype chain, you will get a `TypeError`.

#### Object.create

ECMAScript 5, the latest release of JavaScript with [wide browser support](http://kangax.github.com/es5-compat-table/), defines the new `Object.create` method.  It's argument is an object to be used as a prototype.  It returns a new object whose prototype is the argument object.  If that sounds like gobbledigook, it's ok.  Perhaps seeing it in action will be more revelatory:

```javascript
function Flower(family) {
  this.kingdom   = 'Plantae';
  this.division  = 'Angiospermae';
  this.getFamily = function() { return family };
}

function Orchid(name, isEpiphyte) {
  Flower.call(this, "Orchidaceae");
  this.getName    = function() { return name };
  this.isEpiphyte = isEpiphyte;
}

Orchid.prototype = Object.create(Flower.prototype);
```

The `Flower` constructor is the same as it was before.  The `Orchid` constructor takes advantage of the `Object.create` method to set up a prototype relationship with `Flower` and add some additional properties of its own.  Let's analyze the `Orchid` constructor line by line:

```javascript
function Orchid(name, isEpiphyte) {
  // Calls the parent constructor on the newly instantiated object
  Flower.call(this, "Orchidaceae");

  // Define the method getName for the newly instantiated object
  this.getName = function() { return name };

  // Add the isEpiphyte property to the newly instantiated object
  this.isEpiphyte = isEpiphyte;

  // The new operator implicitly returns the newly instantiated object
}
```

The result is roughly the same as with Constructor prototyping:

```javascript
var vanilla = new Orchid("Vanilla planifolia", false);

console.log(vanilla.isEpiphyte);
console.log(vanilla.getName());

console.log(vanilla.kingdom);
console.log(vanilla.division);
console.log(vanilla.getFamily());
```

As mentioned before, this is by no means an exhaustive account of inheritance patterns in JavaScript.  More like a drop in the bucket.  Please do your own research to understand these concepts better.  There is no way to do them justice in a few pages of text and exercises.

### References

[MDN: Inheritance and the prototype chain](https://developer.mozilla.org/en-US/docs/JavaScript/Guide/Inheritance_and_the_prototype_chain)<br>
[MDN: Details of teh Object Model: Local vs inherited values](https://developer.mozilla.org/en-US/docs/JavaScript/Guide/Details_of_the_Object_Model#Local_versus_inherited_values)<br>
[Douglas Crawford: Prototypal Inheritance in JavaScript](http://javascript.crockford.com/prototypal.html)<br>
[Douglas Crawford: Classical Inheritance in JavaScript](http://javascript.crockford.com/inheritance.html)<br>
[Codecademy: Review of Object-Oriented Programming: Inheritance](http://www.codecademy.com/courses/intro-to-object-oriented-programming/3#!/exercises/0)<br>
[Codecademy: Introduction to Objects II](http://www.codecademy.com/courses/objects-ii)<br>
[ECMAScript 5 Browser Compatibility Table](http://kangax.github.com/es5-compat-table/)
