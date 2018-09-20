# Numbers

#### A quick refresh on primitives

Programming languages provide a set of *primitive* or *basic* data types as building blocks.  Most language also have more complex types that are built from these basic types.  Numbers and strings are the two main basic data types in JavaScript, as they are in Ruby.

We'll go through the basic types and translate what we've already learned about Ruby into JavaScript.

#### And now, on to Numbers:

Unlike Ruby, which differentiates between integers and floating point numbers, JavaScript only defines the `Number` data type. In other words, all numbers in JavaScript are floating-point, even if they are not written with a decimal.

Enter these into the browser console one line at a time to see how they work:

```javascript
5
4 + 2
7.3 / 4
var myNum = 5;
myNum + 5;
typeof 3;
typeof 9.2;
typeof myNum;
```

As you can see above, JavaScript allows you to perform basic mathematical operations on numbers.  Using the sandbox, try out some expressions with the standard operators `+` , `-`, `/`, and `*`.

You may have noticed that if you use `/` with integers that are not evenly divisible, JavaScript will return a decimal. Not quite the same as Ruby, which will only return an integer. Try these:

```javascript
// These will return the same values
7 / 2
4 / 3
5 / 2
// …as these
7.0 / 2
4.0 / 3
5.0 / 2.0
```

JavaScript also supports the modulus operator `%` which returns the remainder of a division operation.

In addition to the usual operators, JavaScript also has a set of methods that can be called on any kind of number numbers.  You can see a list of all of these methods on the [Number page of the MDN reference](https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Number).

If you want to divide two integers and get an integer result (as you would in Ruby), you have to use the Math object's `floor()` method. For example, if you want to write 391 seconds as "6 minutes and 31 seconds", you'd run:

```javascript
var totalSeconds = 391;
var minutes = Math.floor(totalSeconds / 60);
var seconds = totalSeconds % 60;
console.log(totalSeconds + ' is ' + minutes + ' minutes and ' +  seconds + ' seconds');
```

Some of the common methods that you may have used in Ruby already are `Math.abs()`, `Math.floor()`, `Math.sqrt()`, `Math.ceil()` and `Math.pow()`.  Remember, these are methods of the *Math* object, not Number. So you have to call them accordingly:

```javascript
Math.abs(-5);
Math.floor(6.73);
Math.sqrt(16);
var num = 4.7;
Math.pow(num, 3);
```

Check out the links below if you want to explore more.

### References

The Mozilla Developer Network has a lot of great information:

[MDN: JavaScript Data Structures](https://developer.mozilla.org/en/JavaScript/Data_structures)<br>
[MDN: JS Reference: Numbers](https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Number)<br>
[MDN: JS Reference: Math](https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/Math/)
