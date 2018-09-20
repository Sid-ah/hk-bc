# Array Operations

Every `Array` object in JavaScript supports the same set of methods and properties.  It doesn't matter what kind of objects are in the array.

Mozilla's Developer Network provides this useful description for arrays:

>Arrays are list-like objects that come with a several built-in methods to perform traversal and mutation operations. Neither the size of a JavaScript array nor the types of its elements are fixed.  Since an array's size can grow or shrink at any time, JavaScript arrays are not guaranteed to be dense.  In general, these are convenient characteristics, but if these features are not desirable for your particular use case, you might consider using WebGL typed arrays.  [Link to source](https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Array/)

It might be useful to think of array methods as ways of asking an array questions or giving it commands.  What kind of commands could you give an array if you didn't know anything in particular about its contents?

This is a list of some of the common Array methods, properties, and idioms in JavaScript and their equivalent (or closest approximate) in Ruby.  You don't need to read through all of this right now, but you'll be using these a lot.  Come back and use this as a reference.

### Array.first() and Array.last()

One of the significant differences between Ruby and JavaScript is that Ruby was designed for readable code. There are always two interpreters for any given programming langauge: the compiler (i.e. computer) and the programmer (i.e. human). Ruby leans more towards prioritizing the human, JavaScript less so.

Long story short, there are no `Array.first()` and `Array.last()` in JavaScript. We just have to use tried-and-true index notation.  Try this out in the browser console:

```javascript
// Accessing the first element is as simple as using index 0.
[1,2,3][0];
// => 1
var animals = ["cats", "dogs"];
animals[0];
// => "cats"
[true, "cats", 100][0]
// => true
```

Accessing the last element in an array requires a more verbose chunk of code. JavaScript *does not* allow negative indexing (`array[-1]`) of Arrays, but it does provide a `length` property for all array objects. So, implementing Ruby's `Array#last` in JavaScript looks like this:

```javascript
var numbers = [1,2,3];
numbers[numbers.length - 1];
// => 3
var animals = ["cats"];
animals[animals.length - 1];
// => "cats"
var mixed = [true, "cats", 100];
mixed[mixed.length - 1];
// => 100
```

### Array.length

In JavaScript, objects have *properties* and *methods*. `length` is a property that stores the number of elements in an array.  It will be set to `0` if the array is empty. In Ruby, it is a method, though the two are functionally equivalent.

Hint: you can tell it's a property and not a method because it doesn't take a `()` at the end.  `[1,2,3].length()` will throw an error.

```javascript
[].length;
// => 0
[1].length;
// => 1
[1,2].length;
// => 2
[1,2,3].length;
// => 3
```

This is like asking the array, "How big are you?"

```javascript
var months = ["January", "February", "March",
              "April", "May", "June",
              "July", "August", "September",
              "October", "November", "December"];

months.length;
// => 12
```

### Array.length === 0

Like `Array#first` and `Array#last`, Ruby provides a handy `Array#empty?` boolean method. Not so in JavaScript.

To achieve the same feature in JavaScript, we can use a conditional statement that checks if the `length` is `0` or not.

```javascript
[].length === 0;
// => true
["cats"].length === 0;
// => false
[null].length === 0;
// => false
[false].length === 0;
// => false

var array = [1,2,3];
array.length === 0;
// => false
```

### Array.indexOf(object) > -1

In Ruby, the boolean method `Array#include?` takes any object as its input and returns `true` if that object is in the array and `false` otherwise. To do this in JavaScript, we use the <a href="http://en.wikipedia.org/wiki/Method_(computer_programming)#Accessor_and_mutator_methods">accessor method</a> `indexOf()` which takes an object as its input and returns the index of that object in the array, or `-1` if the object is not in the array.

Since `indexOf()` does not return a boolean, a common idiom used in JavaScript is the conditional statement `indexOf(object) > -1`, which will return `true` if `object` is in the array, and `false` otherwise.

```javascript
[1,2,3].indexOf(1) > -1;
// => true
[1,2,3].indexOf("cats") > -1;
// => false

var foo = "pants";
[1,2,3,foo].indexOf("pants") > -1;
// => true

var desserts = ["pie", "cake", "scone"];
desserts.indexOf("steak") > -1;
// => false
```

### Array.join() and String.split()

JavaScript implements `join()` and `split()` in much the same way as Ruby.

`Array.join()` takes a `String` called a _separator_ as its input and returns a `String` formed by converting each element of the `Array` to a `String`, and then combining them into a single string separated by the separator.  That might sound confusing, but an example will make it pretty clear:

```javascript
[1,2,3].join(",");
// => "1,2,3"
[1,2,3].join(" + ");
// => "1 + 2 + 3"

// Happy New Year!
[2012, 12, 31].join('-');
// => "2012-12-31"

// What if we mix objects?
var foo = false;
[foo, 'bar', 10, '20'].join('---');
// => "false---bar---10---20"

// If we don't pass in anything, it uses a `,` comma by default.
[1,2,3].join();
// => "1,2,3"
```

`String` has the inverse method, `String.split()`, which takes a separator as its input and returns an `Array` whose elements are the parts of the string separated by the separator.  Let's look:

```javascript
"1,2,3".split(',');
// => ["1", "2", "3"]
"1 + 2 + 3".split(' + ');
// => ["1", "2", "3"]

// Notice we get an Array of Strings, not an Array of integers
// We'd have to go in after we split the string and convert them,
// if that's what we wanted.  We'll learn how to do that later.
"2012-12-31".split('-');
// => ["2012", "12", "31"]

// This returns an Array whose elements are the characters of the String
"foobar".split('');
// => ["f", "o", "o", "b", "a", "r"]
```


### Array.push() and Array.pop()

`Array.push()` appends ("pushes") a new element to the end of an array, and returns the new (longer) array.  It modifies the underlying array, so be careful. JavaScript implements `push()` in the same way as Ruby, although it doesn't provide the `<<` shovel operator.

```javascript
var array = [1,2,3];
array.push("cats");
array
// => [1, 2, 3, "cats"]

var array = [];
array.push(true);
array
// => [true]
```

`Array.pop()` removes ("pops") the last element from the end of the array.  It's the opposite of `Array.push()`, and returns the element that was removed. It is also a modifier method (changes the state of the source object), so be careful.

```javascript
var array = [1,2,3];
var lastElement = array.pop();
array;
// => [1, 2]
lastElement;
// => 3
```

### Array.unshift() and Array.shift()

`Array.unshift()` and `Array.shift()` behave like `Array.push()` and `Array.pop()`, respectively, except they add and remove elements from the beginning of an array rather than its end. Same behavior in JavaScript as in Ruby.

Here's `Array.unshift()`:

```javascript
var array = [1,2,3];
array.unshift("cats");
array;
// => ["cats", 1, 2, 3]

var array = [];
array.unshift(true)
array;
// => [true]
```

Here's `Array.shift()`, which removes the first element from the array and returns it, modifying the array it was called on:

```javascript
var array = [1,2,3];
var firstElement = array.shift();
array; // => [2,3]
firstElement; // => 1
```

### Concatenating Arrays

Like strings, you can concatenate arrays in JavaScript using the `concat()` method.

```
var array1 = [1,2,3];
var array2 = ['cats', 'dogs'];
var arraySum = array1.concat(array2);
arraySum; // => [1, 2, 3, "cats", "dogs"]
```

Unlike Ruby, the `+` operator *does not* concatenate two arrays into a new array, but instead concatenates all of the elements in each array into a new string. Use `concat()` when you want an array; use `+` when you want a string.

### References

[MDN: JS Reference: Array](https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Array/)<br>
<a href="http://en.wikipedia.org/wiki/Method_(computer_programming)#Accessor_and_mutator_methods">Wikipedia: Accessor and Mutator Methods</a>
