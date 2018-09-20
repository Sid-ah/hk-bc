# Object Literals

In Ruby, the other type of collection besides `Array` is `Hash`, which is its own implementation of the general [associative array](http://en.wikipedia.org/wiki/Associative_array) data type. JavaScript has no built in data type to parallel Ruby's `Hash`, although we can use [object literals](https://developer.mozilla.org/en/JavaScript/Guide/Values,_Variables,_and_Literals#Object_literals) in JavaScript to achieve a similar functionality.

>An object literal is a list of zero or more pairs of property names and associated values of an object, enclosed in curly braces ({}). [Link to source](https://developer.mozilla.org/en/JavaScript/Guide/Values,_Variables,_and_Literals#Object_literals)

We'll dive further into objects in a later section, but for now let's see how we can use JavaScript object literals to achieve the same features provided by `Hash` in Ruby.

Check out the Resources section at the bottom of this page for links to more reading and tutorials.

### Creating Object Literals

Creating a new object literal is easy, and looks surprisingly similar to a hash literal in Ruby.  Type the following into the browser console:

```javascript
var person = { firstName: 'Frank', lastName: 'Hardy', age: 25 };
```

We can verify the data type using the `typeof` keyword:

```javascript
typeof person;
// => "object"
```

For larger objects, it is preferable to break the declaration into multiple lines, like so:

```javascript
var person = {
  firstName: 'Frank',
  lastName: 'Hardy',
  age: 25,
  telephone: '555-555-1234',
  email: 'fhardy@example.com'
};
```

Copy the above code into your browser console so that you can play around with it.

### Reading from Objects

If `person` were a Ruby hash, we would say that it has the keys `firstName`, `lastName`, and `age`. Since this is a JavaScript object, we refer to them as the **properties** of that object.

For example, one might say "give me the `firstName` property of `person`" and write this code:

```javascript
person.firstName;
// => "Frank"
```

In Ruby, the keys can be any data type: string, symbol, array, another hash, etc. This is not the case in JavaScript.

The properties of an object are variables, and must conform to the same character requirements as other variables in JavaScript. Properties can still point to any data type value, including functions.

### Changing an Object

Changing the property of an object is the same as changing the value of a variable, except we have to prefix the property with the object's name. Try this out in the browser console:

```javascript
person.firstName = "Billy";
console.log('Full name: ' + person.firstName + ' ' + person.lastName);
```

You can even use this syntax to add properties that don't already exist.

```javascript
var book = {};
book.title;
// => undefined

book.title = "JavaScript for N00bs";
book.title;
// => "JavaScript for N00bs";
```

In this way, we can extend objects with new properties whenever needed.  If we try to access a property that has not been defined yet, it will return `undefined`.  Nice and simple.

It's important to realize the first example above could also have been written as follows:

```javascript
var person = {};
person.firstName = 'Frank';
person.lastName = 'Hardy';
person.age = 25;
```


### References

[MDN: JS Guide: Object Literals](https://developer.mozilla.org/en/JavaScript/Guide/Values,_Variables,_and_Literals#Object_literals)<br>
[O'Reilly Answers: How to use Object Literals in JavaScript](http://answers.oreilly.com/topic/2138-how-to-use-object-literals-in-javascript/)<br>
[Codecademy: Introduction to Objects I](http://www.codecademy.com/courses/spencer-sandbox)
