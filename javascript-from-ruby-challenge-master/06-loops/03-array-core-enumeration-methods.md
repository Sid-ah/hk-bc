# Array core enumeration methods

Unlike Ruby, JavaScript has a much smaller built in library of objects.  Fortunately, JavaScript does have a some core enumeration methods:

| Ruby | JavaScript |
|:---:|:---:|
| [each](http://ruby-doc.org/core-2.2.0/Array.html#method-i-each) | [forEach](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach) |
| [map](http://ruby-doc.org/core-2.2.0/Array.html#method-i-map) | [map](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map) |
| [select](http://ruby-doc.org/core-2.2.0/Array.html#method-i-select) | [filter](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter) |
| [inject](http://ruby-doc.org/core-2.2.0/Array.html#method-i-inject) | [reduce](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reduce) |



### `forEach`

In Ruby, you might call `Array#each` like this:

```ruby
[1,2,3,4].each { |n| puts n }
```

The `{ |n| puts n }` is the block of code passed to `each`.  JavaScript does not have a separate object for blocks, so we instead use a **callback function**: a function called as an argument from another function.  The parameter `func` stands in for a function which will be called with each element of the array.

Here is an example of how you could use this function:

```javascript
// Define an array
var bugs = ["beetle", "spider", "yellow jacket", "firefly"];

// Execute the each() function, passing it a callback function
bugs.forEach(function (bug) {
  console.log(bug);
});
```

### `map`

Ruby's `Array#map` method will pass each element in an array to a block, and then return a new array of the modified elements.  In JavaScript, it works the same way:

```javascript
// Source array:
var numbers = [5, 12, 2, 81, 30];

var doubledNumbers = numbers.map(function timesTwo(x) {
  return x * 2
});
doubledNumbers; // => [10, 24, 4, 162, 60]
```

### `filter`

The `filter` method works the same way as `select`.  A Each element is passed as an argument to a condition function. Depending upon whether or not the result of the function is *truthy* or *falsy*, the element is included in the resulting array.

```javascript
var numbers = [1, 2, 3, 4, 5]

var evens = numbers.filter(function (number) {
  return (number % 2 === 0);
});

evens; // => [2, 4]
```

We could have extracted the function out of the call to `filter`, into its own named function as so:

```javascript
var numbers = [1, 2, 3, 4, 5]

function isEven(number) {
  return (number % 2 === 0);
}

var evens = numbers.filter(isEven);

evens; // => [2, 4]
```

Try using select on the following arrays to filter out unwanted values:

```javascript
// Select the schools with names that have an 'r' in them:
var schools = ["Berkeley", "Notre Dame", "Chicago", "Stanford", "Tulane"];

// Select the multiples of 5:
var numbers = [4,10,39,105,73,20,15];

// Select the sub-arrays that contain less than 3 elements
var grid = [ [0,1,0,0],
             [1,0,1],
             [1,1,0,0,1],
             [0,1],
             [1,0,0,0] ];
```
### `reduce`

Finally, `reduce` works similarly as `Array#reduce` or `Array#inject` in Ruby.

```javascript
var numbers = [10. 20, 30, 40, 50];

function sum(a, b) { return a + b; }

var total = numbers.reduce(sum);

total; // => 150
```

```javascript
var words = ["Who", "goes", "there"];

function joinWithSpace(a, b) { return a + " " + b; }

var sentence = words.reduce(joinWithSpace);

total; // => "Who goes there"
```

### References

[MDN: JS Reference for Array](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array)<br>
