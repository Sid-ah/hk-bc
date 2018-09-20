# Conditions and Logic

So far we have been working with the simplest programming structure (or program flow) which is called _Sequential Programming_.  All of the statements we have written execute in the order they appear in the program (or in the method).  Often in programming, we need to be able to change which statements are executed based on some additional value.  This programming structure is called the _Selection Structure_ but is often referred to as _Branching_.  In order to make a selection between two separate program flows, we need to be able to create conditional statements.

These lessons will cover the basics of branching in JavaScript, highlighting areas where it overlaps or differs from Ruby.

### Conditional Statements

A **conditional statement** is just a statement that can be evaluated to `true` or `false`, where `true` and `false` are not the strings "true" and "false" but are special values of the global object `Boolean`.

We can create conditional statements using the comparison operators `<`, `>` , `<=`, `>=` , `===`, and `!=` as follows:

```javascript
5 > 4;
3 <= 3;
'cat' > 'dog';
'cat' === 'CAT';
(2 + 1) >= 7;
3 != 7;
```

Type each line above into the browser console and verify that `true` or `false` is returned.  These operators should look familiar to the ones you've used in Ruby, with one difference: the `===` to determine equality. The equality operator is THREE `=` signs, not two.  JavaScript does provide a `==` comparison operator as well, but it performs type conversion before comparing and thus is not testing for *true* equality.  As a rule of thumb, always use the `===` operator in JavaScript unless you know that you want `==`.

### Logical Operators

In addition to the comparison operators, we can use **logical operators** to combine together conditional statements to  create more complex conditional statements.  The logical operators are `AND` represented as `&&`, `OR` represented as `||` and `NOT` represented by `!`.  The `&&` and `||` operators combine together two conditional statements and return a new conditional statement that evaluates to `true` or `false` based on the originals.

All of these are the same as in Ruby, but just to refresh your memory here are some examples:

```javascript
5 > 2 && 4 < 8;
// => true (both conditional statements evaluate to true)

1 > 0 && 3 > 9;
// => false (the second conditional evaluates to false, thus the pair evaluates to false)

2 > 5 && 4 < 7;
// => false (the first conditional evaluates to false, thus the pair evaluates to false)

7 > 8 && 0 > -1;
// => false (both conditionals evaluate to false)


5 > 2 || 4 < 8;
// => true (both conditionals evaluate to true)

1 > 0 || 3 > 9;
// => true (the first conditional evaluates to true, thus the pair evaluates to true)

2 > 5 || 4 < 7;
// => true (the second conditional evaluates to true, thus the pair evaluates to true)

7 > 8 && 0 > -1;
// => false (both conditionals evaluate to false)
```

Notice that the only way an `&&` is true is if both original statements are true, and the only way an `||` is false is if both original statements are false.

The third logical operator is `NOT`, represented as `!`.  The `!` operator changes the truth value of any conditional statement.  So if the conditional statement `x < 3` is true, then the statement `! ( x < 3)` is false.

For each of the following conditional statements, use the given input values to determine the truth value by hand, then type it into the browser console to verify.

```javascript
var x = 112;
var y = 2;
(x === 113 && y != 2);

var x = 112;
var y = 2;
!(x === 113 && y != 2)

var height = 120;
var width = 280;
!(height < 100 || width > 275);

var temperature = 99;
var pressure = 20;
var volume = 250;
(temperature < 100 || pressure < 20 || volume >= 250);

var cost = 100;
var price = 120;
var tax = .05;
var income = 50;
(cost > price && price < tax && tax  > income*0.5);
```

When working with logical operators, it is important to be very careful and use parentheses to insure the proper order of operations. One of the key errors encountered when working with logical operators is using an `||` when you should be using an `&&`.  To avoid this error, make sure you always test all possible cases against your conditional.

### Boolean Methods

Ruby provides a plethora of boolean methods (`eql?`, `include?`, etc.) that work like a conditional statement, returning a boolean value. JavaScript does not go to such lengths for its global objects. Poring over the documentation, the only boolean method defined in core JavaScript is `Regexp.test()`.

In other words, you will have to write out your conditional statements in JavaScript instead of using handy methods. Of course, you could always define your own boolean methods...

### Truthiness and Falsiness

Conditional statements can also be formed without making an explicit statement.  You may recognize something like this from Ruby: `puts @foo if @foo`. The conditional in this instance is evaluating a boolean value (`true` or `false`) from an object (`@foo`).

JavaScript, like Ruby, has a concept of *truthy* and *falsey* values. It allows us to convert objects to a boolean value to be used in a conditional, though it uses some slightly different rules.

#### Objects that evaluate to `true`:

* Any `Number` besides `0`
* Any `String` with a length greater than zero
* Any defined object
* The `Boolean` object `true`

#### Objects that evalute to `false`:

* `undefined`
* `null`
* The `Number` objects `0` and `NaN`
* An empty `String` (`''` or `""`&mdash;length is zero)
* The `Boolean` object `false`

Here are some examples of how these might be used:

```javascript
if ("hello") { console.log("It's alive!") }

var num = 5;
if (num) { console.log("five") }

var foo;
if (foo) { "foo is an undefined variable." }

if (4 - 3) { "not zero!" }
if (4 - 4) { "you shoudn't see me." }

if (! null) { "NOT NULL!" }

if (true) { "The Truth" }
```

### References

[MDN: JS Reference: Comparison Operators](https://developer.mozilla.org/en/JavaScript/Reference/Operators/Comparison_Operators)<br>
[Truth, Equality, and JavaScript](http://javascriptweblog.wordpress.com/2011/02/07/truth-equality-and-javascript/)<br>
[Codecademy: Conditionals in JavaScript](http://www.codecademy.com/courses/conditionals-in-javascript)
