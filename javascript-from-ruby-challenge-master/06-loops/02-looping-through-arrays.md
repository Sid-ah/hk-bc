# Looping through Arrays

Running a loop a fixed number of times has limited use.  Usually we want to say something like, "Run this piece of code as many times as there are people in this phone book."  Let's apply this idea to a simple array of strings:

```javascript
var dogs = ["husky", "great dane", "labrador retriever", "chihuahua", "terrier"];
```

If we wanted to print out each of these strings to the console, for example, we could write something like this:

```javascript
console.log(dogs[0]);
console.log(dogs[1]);
console.log(dogs[2]);
console.log(dogs[3]);
console.log(dogs[4]);
```

But that is pretty bulky and ugly. We can use a `for` loop to do the same thing, but in less code:

```javascript
var index, count;

for (index = 0, count = dogs.length; index < count; index++) {
  console.log(dogs[index]);
}
```

Code inside a block (`{ like this }`) can see variables defined outside itself, which means we can use variables to determine what to print. In this case, we are indexing into an array referenced by the variable `dogs`.

Since our `for` loop defines an incrementor `i` which starts at `0` (just like the index on an array, if you noticed), we can use that same variable to access elements within the array: `dogs[i]`. Thus, each iteration of the loop will print the subsequent element in the array.

Alternatively, we could use a while loop:

```javascript
var index = 0
var count = dogs.length;

while (index < count) {
  console.log(dogs[index++]);
}
```


Try this out in the browser console for yourself.

### It's all in the .length

Let's suppose that we want to sort an array of integers into two arrays: odds and evens.  In order to accomplish this, we have to iterate through each element in the source array, determine whether it is odd or even, and the shove it into the appropriate destination array.  We need a loop that will execute *as many times as there are elements in the array*.  Take a look at how we would write this, and try it out in the browser console:

```javascript
// First, we set up the source and destination arrays
var integers = [3,8,1,6,2,0,5,7];
var odds     = [];
var evens    = [];
var n;

// Then define the loop
for (n = 0; n < integers.length; n++) {
  if (integers[n] % 2 === 0) {
    evens.push(integers[n]);
  } else {
    odds.push(integers[n]);
  }
}

console.log(integers);
console.log(odds);
console.log(evens);
```

Experiment with this loop and create your own until you feel comfortable with the syntax.

### for ... in ...

There is another way to write `for` loops in JavaScript that is a bit closer to looping in Ruby.

Instead of writing `for` with a series of statements outlining the parameters of the loop (intial value, conditional, incrementor/decrementor), we can use the `for (x in y)` syntax, where `x` is a variable representing an incremtable value and `y` represents an object with a `length` property, such as `Array`. Let's try it out on a simple array. Run this in the browser console:

```javascript
var nums = [6,0,1,9,3];
var i;

for (i in nums) {
  console.log(i);
}
```

The `i` variable still acts as an incrementor, just like the longhand syntax (`for (var i=0; i<n; i++)`) above.  Did you expect it to hold the value of each element in the array?  Nope, sorry.

`for...in` is different from the above syntax in one very important sense: it will iterate through the elements of an enumerable object *in an arbitrary order*.  Do not use `for...in` if you are concerned with maintaining the sequential order of your array.

### **STRETCH:** Missing Ruby's Enumerables

One of the selling points of Ruby, in its early days, was its robust `Enumerable` method collection. In your time working with DBC, you may have grown exceedingly fond of these methods and might be missing them. They're really handy!

Responding to desire for these methods to appear in JavaScript, JavaScript's `Array` has gained, among others, the methods `forEach`, `reduce`, and `filter`. While these methods offer much of the convenience of Ruby's `Enumerable`, there are a number of quirks to their use that may require further investigation on your part. Check out the examples provided at MDN and try to update the preceding code to take advantage of these methods. What might the trade-offs be? What's clearer? What's more opaque? Examine the [Array.prototype](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array) documentation.

### References

[MDN: JS Reference: for Statement](https://developer.mozilla.org/en/JavaScript/Reference/Statements/for)<br>
[MDN: JS Reference: for ... in Statement](https://developer.mozilla.org/en/JavaScript/Reference/Statements/for...in)<br>
[MDN: forEach](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach)  
[MDN: reduce](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/Reduce)  
[MDN: filter](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter)  
[Codecademy: Loops in JavaScript](http://www.codecademy.com/courses/loops)
