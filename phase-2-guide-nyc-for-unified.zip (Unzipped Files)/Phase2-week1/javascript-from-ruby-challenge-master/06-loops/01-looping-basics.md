# Looping Basics

The idea of looping is common to all programming languages: doing something over and over again.  Each language provides their own syntax for creating loops, and JavaScript is quite different from Ruby in this regard.

Like Ruby, JavaScript has loops. The `for` and `while` keywords form the foundation for all looping in JavaScript. It might not seem like much right now, but you can get very creative with these to create the right loop for the job.

### Reviewing Loops

If you think about it, all loops can be boiled down to two basic types:

1. Loops that perform a certain action *a set number of times*
2. Loops that perform a certain action *until a specified condition is met*

In Ruby, we can identify the first type in methods that execute a block of code either (1) a pre-defined number of iterations (e.g. `Integer#times`) or (2) for every element in a collection (`Array#each`, `Enumerable#reject`, etc.). In JavaScript, all of these kinds of loops are covered by the `for` keyword.

The second type is exemplified in the `while` keyword, which both Ruby and JavaScript implement. We'll cover `while` loops first.

### While Loops

A `while` loop is the simplest type of looping operation: do something until a condition evaluates to `false`. Here is an example of a basic `while` loop:

```javascript
var n = 1;

while (n <= 5) {
  console.log("n is equal to " + n);
  n = n + 1;
}
```

Before every iteration in a `while` loop, the conditional statement is evaluated. If it is `true`, the loop runs again. If it is `false`, the loop stops. In this case, the loop will run as long as the variable `n` is less than or equal to `5`.

There is one significant pitfall to watch out for: **infinite loops**. For example, what would happen if we wrote the above loop without the `n = n + 1;` statement?

Think about it. Every time the loop is run, it evaluates the conditional. If the value of `n` never changes, then the condition will always be `true`. Which means that the loop will just keep going, and going, and going... to infinity. This is not usually what you want. In fact, it will crash your console if you try it.

Moral of the story: **always provide an exit strategy for your loops.**  Identify how they will terminate, and provide them with the means to (eventually) do so. Don't just let them do their thing forever.

### For Loops

A `for` loop, as mentioned above, is useful for looping with a given number of iterations. Use it when you want to do something `x` times, such as changing the values in an array or counting the number of vowels in a string.

The common and fundamental syntax for a `for` loop in JavaScript is as follows:

```javascript
var i;

for (i = 0; i < n; i++) {
  // block of code
}
```

Let's break that down:

1. We start with the keyword `for`, which identifies this statement as a `for` loop and tells JavaScript to look for the parameters that govern how the loop will operate.
2. Within the parentheses, JavaScript expects three instructions to set up our loop. The first is the `var i = 0`, which assigns the starting value for our *incrementor*, in this case represented by the variable `i`. An incrementor is used to keep track of how many loops have been executed.
3. The second statement in the parens &mdash; `i < n` &mdash; is a conditional statement that is executed before each iteration in the loop. If the statement evaluates to `true`, the next iteration is run; if `false`, the loop will stop. In this case, the variable `n` is just standing in for a number.
4. The last statement &mdash; `i++` &mdash; identifies the action to be taken at the end of each loop. In this case, we are incrementing the variable `i` by one each time. `i` will be equal to `0` for the first iteration of the loop, `1` for the second iteration, `2` for the third, and so on.
5. Finally, within the curly braces `{ }` is the code we want to run with each iteration.

In this way the control flow of the loop is established.

Note that the variables defined in the above example are just examples. This code is effectively the same:

```javascript
var foo;

for (foo = 0; foo < bar; foo++) {
  // block of code
}
```

You don't always have to count up from zero, either. All of the following loops are valid. Can you figure out how they work? Use the browser console to try it out.

```javascript
var i, x;

for (i = 10; i > 0; i--) {
  console.log(i);
}
console.log("Happy New Year!!");

for (x = 100; (x / 1000) <= 1; x += 100) {
  console.log(x);
}
```

That's enough conceptual stuff for now. In the next lesson, we'll cover some practical applications for looping.

### References

[MDN: JS Reference: for Statement](https://developer.mozilla.org/en/JavaScript/Reference/Statements/for)<br>
[MDN: JS Reference: while Statement](https://developer.mozilla.org/en/JavaScript/Reference/Statements/while)<br>
[Codecademy: Loops in JavaScript](http://www.codecademy.com/courses/loops)
