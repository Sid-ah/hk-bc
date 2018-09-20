# What are Objects and Classes?

Before we get into Objects and Classes in JavaScript, let's review the fundamental concepts.  Then we will be better prepared to discuss instantiation and inheritance in the context of JavaScript and how it compares to Ruby.

### Objects

Objects in JavaScript are lists of *properties* that either store data about the object or functions that manipulate the object.  This is slightly different from Ruby, where objects expose *methods*.

We already looked at object literals, but here is a reminder of what they look like:

```javascript
var country = {
  population: 281931,
  anthem: "We Are So Great",
  flagColors: ["green", "blue", "white", "yellow"],
  addCitizens: function(number) {
    this.population += number;
  }
};
```

Each of the words on the left of the colon (`population`, `addCitizens`, etc.) are *properties* of the object `country`.  The first three properties store data (strings, arrays, numbers, other objects, etc.), while the last property `addCitizens` points to a function that changes the data stored in the object.

As in Ruby, an object's properties "travel along" with it wherever it goes.  After defining the object above, we can retrieve its data using dot notation:

```javascript
country.population; // => 281931
country.flagColors; // => ["green", "blue", "white", "yellow"]
```

We can also invoke the functions stored in the object using the same notation:

```javascript
country.addCitizens(100000);
// Now, let's check to be sure that the population did increase:
country.population; // => 381931
```

`addCitizens` is technically a property of the object `country`, but it is also a method, since it is a function that is defined within the object literal `country`.

Our working definition of an object in JavaScript is thus: a bundle of data and functionality that lives in a program.

What, then are classes?

### Classes

Ruby has many classes (`Hash`, `String`, `Enumerable`, etc.) and even allows us to define our own classes, using the `class` keyword.  This is because Ruby is a *class-based* and *object-oriented* language.

Classes in Ruby are like blueprints, as mentioned before.  They contain instructions for creating new objects based on the definition of the class.

JavaScript is not class-based.  There is no `class` keyword, and no notion of a class as we think of it in Ruby.

JavaScript is also an object-based language, though it employs a different **object model** from Ruby.  The object model of JavaScript is *prototype-based* instead of *class-based*.  The Mozilla Reference provides a good definition of prototype-based languages:

>A prototype-based language has the notion of a prototypical object, an object used as a template from which to get the initial properties for a new object.   Any object can specify its own properties, either when you create it or at run time.  In addition, any object can be associated as the prototype for another object, allowing the second object to share the first object's properties. [Link to source](https://developer.mozilla.org/en-US/docs/JavaScript/Guide/Details_of_the_Object_Model)

Read the [full article](https://developer.mozilla.org/en-US/docs/JavaScript/Guide/Details_of_the_Object_Model) for a more complete explanatin of JavaScript's object model.

You may encounter developers who refer to classes in JavaScript, i.e. "the String class".  While technically inaccurate, it is not a wholly wrong way to refer to the structure of JavaScript.  The notion of objects inheriting from prototypes is a hierarchy system similar to the class structure in Ruby, and so the word "class" is thrown around to mean roughly the same thing.

There's no need to get confused when someone refers to "the Array class" in JavaScript.  Classes are just a programming concept, after all.  They are not some physical certainty that can be pointed to.  It is just a shorter and easier way of saying "the Array global object".

#### Using Constructors to Mimic Class Instantiation

Let's revisit the example provided in Ruby Intro of a `Person` class.  We can still use JavaScript to organize objects in a hierarchical fashion, and to construct new objects based upon a *constructor* (we'll cover what a constructor is in the next lesson).

Here is how we could build a program to model the relationships between (1) people and the idea of a "Person", (2) a band and the idea of "Bandness", (3) an album and the idea of "Albumness", and (4) the way that each of these objects interacts with each other.

```javascript
var rogerDaltrey  = new Person("Roger Daltrey");
var peteTownshend = new Person("Pete Townshend");
var johnEntwistle = new Person("John Entwistle");
var keithMoon     = new Person("Keith Moon");

var theWho = new Band("The Who");
theWho.addMember(rogerDaltrey);
theWho.addMember(peteTownshend);
theWho.addMember(johnEntwistle);
theWho.addMember(keithMoon);

var bestAlbum = new Album("Who's Next");
theWho.addAlbum(bestAlbum);
```

`Person`, `Band`, and `Album` are all object constructors we'd have to write ourselves, as are the `addMember` and `addAlbum` methods (functions defined as property values of `Band`).

#### Object and Class Vocabulary

Using the example above, the following statements are all true:

1. `rogerDaltrey`, `peteTownshend`, etc. are objects created from the `Person` constructor
2. `Person`, `Band`, and `Album` are constructor functions
3. `keithMoon` is an object
4. `keithMoon` is an object created from the `Person` constructor
5. `theWho` is an object created from the `Band` constructor
6. `"The Who"`, passed to `new Band()`, is an object of type `String`
7. `addMember` is a method on `theWho` object
8. _Who's Next_ is The Who's best album.

### References

[MDN: Details of the Object Model](https://developer.mozilla.org/en-US/docs/JavaScript/Guide/Details_of_the_Object_Model)<br>
[MDN: Working with Objects](https://developer.mozilla.org/en-US/docs/JavaScript/Guide/Working_with_Objects)
