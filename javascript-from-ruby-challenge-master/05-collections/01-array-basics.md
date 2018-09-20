# Array Basics

Arrays are the most fundamental kind of collection.  JavaScipt, like Ruby, allows us to work with Arrays. We'll go over some of the differences between how the two languages implement Arrays and which methods they provide.

### Creating Arrays

Creating a new `Array` is easy.

```javascript
var powersOfTen = [1, 10, 100]
```

`powersOfTen`, a variable, now holds the array `[1,10,100]` as its value.  The first element is `1`, the second is `10`, and the third is `100`.

Here are some more examples of arrays:

```javascript
// This is an empty array
[]

// This is an array with a single element, the string "apples"
["apples"]

[1,2,3]

// This is an array of all the months
["January", "February", "March", "April", "May", "June", "July", "August", "September", "November", "December"]

// The elements of an array don't all need to be the same type.
// In fact, that can be any type.
[10, "cats", 4.5, "piano"]

// We can use variables in arrays, too.
var favoriteFruit = "grapes";
[1, 2, favoriteFruit] // => [1, 2, "grapes"]
```

### Reading from Arrays

Let's take a look at that array of months from above.  Paste the following into the browser console.

```javascript
var months = ["January", "February", "March",
              "April", "May", "June",
		      "July", "August", "September",
		      "October", "November", "December"];
```

(Yes, you can split up array declarations across multiple lines in JavaScript, so long as the line ends with a comma.)

As in Ruby, we can read an element from an array by *indexing* the array, a fancy way of telling the array: "Give me the element at *this* position."

Make sure you've entered in the code that defines the `months` array above, then type the following into the browser console:

```javascript
// You "index into" an array using the bracket [...] notation.
// The index (an integer) goes between the brackets

// What's at index 0?
months[0];
```

When you type `months[0]` into the console, it should return `"January"`.

JavaScript follows the same 0-based indexing as Ruby and most other programming languages.

Type the following, one at a time, in the browser console:

```javascript
months[1];
months[11];

// The index can be a variable that holds an integer, too
var monthNumber = 5;
months[monthNumber];
```

### Changing Arrays

Yes, JavaScript let's you change the values in an array, too.

```javascript
var array = [1,2,3];
console.log('array[2] is ' + array[2]);
array[2] = "apples";
console.log('array[2] is now ' + array[2]);
```

### Array Vocabulary

JavaScript uses the same vocabulary to describe arrays as Ruby does.  As a refresher, using the `months` array, the following statements are all true:

* The string `"January"` is the first element of the array
* The string `"January"` is at index `0`
* The string `"December"` is the last element of the array
* The string `"December"` is at index `11`
* The array has `12` elements
* The value at index `3` is the string `"April"`, which is the fourth element of the array

### References

[MDN: JS Reference: Array](https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Array/)<br>
[Codecademy: More Fun With Arrays](http://www.codecademy.com/courses/working-with-indexed-associate-and-multi-dimensional-arrays)<br>
[hunlock.com: Mastering JavaScript Arrays](http://www.hunlock.com/blogs/Mastering_Javascript_Arrays)
