# OOJS: Model an Orange Tree

## Summary
Remember the [orange tree][orange tree challenge] objects that we built in Ruby?  We're going to build JavaScript objects with the same attributes and behaviors.  

We're going to create orange trees through a constructor function.  The constructor will initialize each tree with its own unique attributes: age, height, and a collection of oranges.  All trees might start being zero years old, zero feet tall, and with an empty collection of oranges; but, these attributes are unique to each tree object—they're not shared.  On the other hand, the behaviors of orange trees will be shared.  All trees will share methods for aging, growing, etc.


### Prototypal Inheritance
When thinking about inheritance in JavaScript, throw out what we know about method lookup in Ruby—well, most of it, anyway.  JavaScript doesn't have classes, so when an object itself doesn't have a property, we can't look in the class, parent class, grandparent class, etc.  Instead, JavaScript objects inherit properties from their prototypes.  So, what is a prototype and how does an object get a prototype?

Every JavaScript function has a `prototype` property.  Regardless of whether we intend to use the function as a constructor or not, when we write a function, JavaScript will give the function a `prototype` property and set its value to a new empty JavaScript object (`{}`, see Figure 1).

```js
// Create a function and check its prototype property.
var addition = function(number1, number2) {
  return number1 + number2;
}
addition.prototype;
// => {}


// Create a function to use as a constructor
// and check its prototype property.
var Person = function(name) {
  this.name = name;
}
Person.prototype;
// => {}


// Each function's prototype is a unique object.
addition.prototype === Person.prototype;
// => false
```
*Figure 1*. Creating functions and looking at the value of each function's `prototype` property.


So, every function has a `prototype`, how does that affect inheritance?  A function's `prototype` object comes into play when we use a function as a constructor (e.g., `new Person("Jamie")`).

When we use a function as a constructor to initialize an object, the newly created object gets a link to the constructor's prototype object.  Through this link, the new object has access to the prototype object's properties. In a manner of speaking, the new object "inherits" the properties defined on the constructor's prototype.  All objects made with the same constructor share the constructor's prototype. In this way, things like methods can be shared by multiple objects.

Figure 2 presents some code to demonstrate these concepts; follow along in the browser console or the node REPL if node is installed on our system (use the `node` command from the command line).

```js
// Create a constructor function and check its prototype.
var Person = function(name) {
  this.name = name;
}
Person.prototype;
// => {}


// Give the Person constructor's prototype a greeting property.
Person.prototype.greeting = 'Hello';
Person.prototype;
// => { greeting: 'Hello' }


// Create a new Person instance, jamie.
jamie = new Person('Jamie');
// => { name: 'Jamie' }


// Look up the object from which the jamie object inherits.
Object.getPrototypeOf(jamie);
// => { greeting: 'Hello' }


// The object from which the jamie object inherits
// is the Person constructor's prototype.
Object.getPrototypeOf(jamie) === Person.prototype;
// => true


// The jamie object does not have a greeting property 
// but inherits it from its prototype.
jamie;
// => { name: 'Jamie' }
jamie.greeting;
// => 'Hello'


// Other objects instantiated through the Person constructor
// also inherit from the constructor's prototype.
nicky = new Person('Nicky');
// => { name: 'Nicky' }
nicky.greeting;
// => 'Hello'


// Add another property to the Person constructor's prototype, 
// and show that is it inherited by the Person objects.
Person.prototype.bigName = function() {
  return this.name.toUpperCase();
}
jamie.bigName();
// => 'JAMIE'
nicky.bigName();
// => 'NICKY'
```
*Figure 2*.  Exploring prototypal inheritance in JavaScript.


## Releases
### Release 0: Model an Orange Tree
Here are some details for how our orange tree model will behave.  Don't worry about modeling things like how the temperature affects production; we're just building a basic model.  Each of these details should be translated into tests (`spec/orange_tree_spec.js`), so that we can verify that our model conforms to each expectation.  Suggested property names are in parentheses; our model may very well include more properties than these.

- A tree has an age, which we should be able to check (`age`).
- A tree has a height, which we should be able to check (`height`).
- A tree has a collection of oranges, which we should be able to check (`oranges`).
- We can check if a tree is old enough to produce fruit (`isMature()`).
- A tree dies at age 100, and we can check if it's dead (`isDead()`).
- We can check if a tree has any oranges (`hasOranges()`).
- Each growing season (`passGrowingSeason()`) ...
  - Any unharvested oranges from the previous season should drop.
  - A tree should age one year.
  - A tree should grow 2.5 feet taller until it reaches its maximum height, say 25 feet.
  - A tree should bear fruit if it is mature (i.e. at least six years old), say 10 oranges.
- We can pick an orange off a tree (`pickAnOrange()`).


## Conclusion
Prototypal inheritance is different from the class-based inheritance found in Ruby.  When we try to access a property of an object, property look up starts with the object itself.  If the object has the property, the value of the property is returned.  If the object doesn't have the property itself, then we look for the property in the object's prototype ... then the prototype's prototype, an so on.  We should leave this challenge understanding how to share properties among objects created through the same constructor function by relying on inheriting from the constructor's prototype object.


[orange tree challenge]: ../../../orange-tree-1-just-oranges-challenge