# If Statements

Now that we know how to write conditional statements, we can use them to modify the flow of the program between different branches.

The basic branching structure in JavaScript, as in Ruby, is the `if` branch.  The most basic `if` branch allows the program to run a particular set of code (or a branch) when a condition is true.  Here are some `if` branches:

```javascript
if (x < 3) {
  console.log("This is a small number");
}

if (temp > 60 && temp < 80 ) {
  console.log("It is a nice day outside");
}

if (num1 === 5) {
  var value = num1 * 5;
}
```

Using the browser console experiment with these statements by assigning different values to the variables in the conditional statement to make it true or false. Notice that when the conditional statement is false there is no output because the flow of the program does not go into the body of the `if` branch.

JavaScript does not have an `unless` statement. Sorry. If you want to use the opposite of an `if` statement, just use the `!` modifier: `if (! condition) { code }`.

Also, JavaScript does not allow you to use `if` statement modifiers à la Ruby: `puts 'six' if 3 + 3 == 6`.

### If / Else If

Often we want to branch into more than just one option.  In Ruby we would use the `elsif` keyword. In JavaScript we use `else if`.  An `else if` branch is written after the initial `if` and is used to test an additional condition.

The branches are tested in order and if one of them is true, then the body of that branch executes and the remaining statements in the `if` structure are skipped.

An `if` structure can have as many `else if` branches as you like.  Here is an example of an `if / else if` structure used to compute a course grade:

```javascript
var grade;

if (average >= 90) {
  grade = "A";
}
else if (average >= 80) {
  grade = "B";
}
else {
  grade = "F";
}
```

As you see in the code above, the `else` branch must be the last branch in the if structure.  An `else` branch has no conditional statement and it will only be executed if all the other branches evaluate to `false`.  The `else` is often used for a default value or a fall through to make sure a value is assigned.

### References

[MDN: JavaScript Reference: if...else](https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Statements/if...else)
