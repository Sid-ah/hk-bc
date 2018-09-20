# Function Basics

Whenever we have an action we want to perform like adding two numbers or parsing a string, we will define that action in a function.

There are three basic components to every function in JavaScript:

1. **Name** - keyword to identify the function. Should be concise and descriptive of the action performed.
2. **Parameters** - input values for the function which are treated as local variables within the function body.
3. **Body** - the code to be executed when the function is called.

The simplest syntax for defining a function is to assign a statement using the `function` keyword to a variable:

```javascript
var foo = function(bar) { bar + 'baz'; };

// Literally, the parts of the function:
var name = function(parameter, parameter) { body; };
```

These same functions could also be declared using the following approach:

```javascript
function foo(bar) { bar + 'baz'; }

// Literally, the parts of the function:
function name(parameter, parameter) { body; }
```

For all intents and purposes, declaring the functions `foo` and `name` this way achieves the same effect as in the previous example. _Out in the wild_, it's extremely common to see functions declared in his fashion, so it's very important to be comfortable with this approach as well.

### Invoking a Function

In Ruby, methods can be invoked just by calling their name and parameters (either enclosed in parentheses or not), e.g. `puts('Hello world!')`. Invoking a function in JavaScript is similar, except that the parentheses are *required* even if the function does not take any parameters.

Thus, invoking the function defined above would be written as `foo()`. Run this code in the browser console:

```javascript
function sayHello() { 'hello'; }

sayHello();
```

What happens when we invoke `sayHello()`?  Did you expect it to return the string `'hello'`?  That's a fine expectation&mdash;it is what Ruby would do, after all. Not the case in JavaScript.

### Return Values

We know that methods in Ruby can take arguments as input and produce output.  The same is true in JavaScript.  The output of a function is also called its **return value**.

In JavaScript, there is *no implicit return*. Returning a value from a function requires using the `return` keyword explicitly. In order to get the function `sayHello()` to give us the string `hello` when we invoke it, we would have to write it like this:

```javascript
function sayHello() { return 'hello'; }
```

Any other code we put within the function body will be executed, but it will not be returned. The function below will return the sum of two numbers:

```javascript
function add(x, y) { return x + y; }
```

Though we could also add any other statements we want to the function body. Copy this code into the browser console:

```javascript
function add(num1, num2) {
  var sum = num1 + num2;
  return sum;
}

add(5,9);
```

Because the `add()` function includes a `return` clause, we can use its return value in other statements. For example:

```javascript
console.log(10 / add(2,3));
```

Codecademy has a good [set of exercises](http://www.codecademy.com/courses/functions-in-javascript-2-0/2) on `return` if you want to explore more.

### Parameters

When we define a function, we can provide an optional list of *parameters* (also called *arguments*).  This is a list of values that will be available to use within the function body.

Each parameter is actually a local variable that is only available within the body of the function.  The concept of where a variable is defined and where it is available to use is referred to as the variable's _scope_. As in Ruby, there are several levels of scope in JavaScript, and parameters are defined as having local scope.

When we call (invoke) a function, we pass arguments or values which are assigned to each parameter in the list. For example, consider the method definition:

```javascript
function doSomething(firstName, num, age) {
  return "You entered name: " + firstName + ", num: " + num + ", age: " + age;
}
```

This method has three parameters, so we need three arguments to call the method.  Here are two examples of calling the method:

```javascript
doSomething("Alex", 42, 12);

var firstName = "Ken";
var num = 15;
doSomething(firstName, num, 21);
```

As you can see, arguments can either be an object (like `"Alex"` and `42`), or variables (like `firstName` and `num`). The arguments are matched to the parameters based on their position in the parameter list.

Thus when we look at the call `doSomething(firstName, num, 21)` the argument `firstName` is in the first position so it matches to the parameter `firstName`.

The important thing to notice is that even though the name of the parameter and argument are the same, this is irrelevant; they are matched on position only.  To illustrate this further, consider the call:

```javascript
doSomething(firstName, 33, num);
```

In this case the third argument `num` gets passed to the parameter `age` because it is in the third position.


### References

[MDN: JS Reference: Functions and function scope](https://developer.mozilla.org/en/JavaScript/Reference/Functions_and_function_scope)<br>
[Codecademy: Review of Functions in JavaScript](http://www.codecademy.com/courses/functions_in_javascript)
