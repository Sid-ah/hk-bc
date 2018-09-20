## OOJS Lecture




### Object Literals
This is the simplest way to represent an object in JS.  Another name for this is an object literal

```js
{};
```

I can assign it to a variable

```js
var foo = {};
```
	
I can give it properties and define functions

Notice this is similar to a ruby hash in that it contains name:value pairs

If I know that I'm only going to have one instance of this object and not need to create others, this is perfectly ok.

Typically we use these types of objects to pass data (as we do on an ajax request)

```js
var mySpecialObject = {

        someProperty: "Foo",
        someOtherProperty: "Bar",
        8: "WTF?",
        mySpecialFunction: function () {
        	return "I'm a special function";
        }
};
```

#### Interacting with an Object Literal

I can access this object and it's properties/methods in several different ways.

I can do direct access of it's properties and methods using a period `'.'` Remember properties that are functions must include the parenthesis when you invoke them.

```js
mySpecialObject.someProperty
mySpecialObject.someOtherProperty
mySpecialObject.mySpecialFunction()
```

Note:  this below is not allowed. If I create a key that is a number, I cannot use the number with a period to access it.  I can only use the square brackets.
```js
mySpecialObject.8
```

I can use square brackets `'[]'` to index it similar to a hash. 
 
```js
mySpecialObject[8]
mySpecialObject["someProperty"]
mySpecialObject["someOtherProperty"]
```

I can also add properties and functions to an Object literal on the fly.

```js
mySpecialObject.someCrazyNewThing = 5;
mySpecialObject.someCrazyNewFunction = function () {
	return "I'm new";
}
```

You can only have one instance of the object literal.  Assigning it to another variable, just creates a copy.  
```js
var myOtherObject = mySpecialObject;
```

### Constructor Functions

If I want to be able to create different instances of an object, I can use a constructor function to accomplish this.  

This is the closest thing to writing a class in JS that you will see
	
```js
var Person = function(firstName, lastName, ssn) {
	//private vars & methods
	var ssn = ssn;
	var that = this;
	
	function getLastFour() {
		// i can use 'that' here to refer to 'this' Person properly
		// this inside of a private method like this gets scoped globally
		// I do not need 'this.' to access private vars & methods of this object.
		console.log(that);
		return ssn.substring((ssn.length - 4), ssn.length);

	}
	
	// public vars and functions use 'this'
	this.firstName = firstName;
	this.lastName = lastName;

	this.maskedSSN = function() {
		return "XXX-XX-" + getLastFour();
	}
}
```

#### Accessing properties & functions of an object created with a constructor function

```js 
kevin = new Person("Kevin", "Solorio", "123456789");
kevin.firstName
kevin.lastName
```

Because I scoped ssn, that and getLastFour() to be local to the Object, I cannot access them once I have an instance unless I scope it through a public method like getSSN()

```js
kevin.ssn
kevin.that
getLastFour()
```

Don't forget the new keyword when creating new object with constructor functions.  It will have unintended effects.  What you will see is that all the properties of the Person object joe are placed on the window object.

```js
// forgetting the new keyword will produce undesirable effects
joe = Person("Joe", "Smith", "123456789");
window.firstName
```

### Prototypes

Prototypes allow me to add methods to the object.  The reason this is preferred over doing it in the contstructor function itself, is because it adds all the methods to the protoype for the object to use rather than defining it every time with the constructor function.  Helps with memory management.

```js
Person.prototype.fullName = function(){
        return this.firstName + " " + this.lastName;
}

Person.prototype.initials = function() {
        return this.firstName[0] + this.lastName[0];
}

kevin.fullName();
kevin.initials();
```

Note:  I cannot access private variables or methods if I define a method with prototype as shown below.  It does not have visibility to the private things.
```js
Person.prototype.maskedSSN = function() {
 	return "XXX-XX-" + this.ssn.substring((this.ssn.length - 4), this.ssn.length);
}

kevin.maskedSSN();
```
	
### Object.create() - object creation alternative

I can define a set of functions as a hash and pass it to the Object.create().  This will add all the functions to prototype.

```js
var behavior = {
	fullName: function() {
		return this.firstName + " " + this.lastName;
	}, 
	initials: function() {
		return this.firstName[0] + this.lastName[0];
	}
}

var person = Object.create(behavior);
person.firstName = "Bob";
person.lastName = "Smith";
person.fullName();
```



