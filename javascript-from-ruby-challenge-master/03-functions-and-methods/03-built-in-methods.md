# Built-in Methods

JavaScript comes with a library of built-in methods both for *core* JavaScript and *client-side*.  In this lesson, we'll be focusing on the methods for *core* JavaScript, which includes the global objects `Number`, `Array`, `Boolean`, and `String`, to name a few.  Some of these methods you will recognize from Ruby, and others will be new.

Note: besides the built-in methods for global objects, JavaScript provides a long list of methods for *client-side* functionality. In a web client (a browser), you will want to do things like retrieve the current url, or home in on a specific element in the DOM. There is a lot to explore in this realm, but that is beyond the scope of this lesson.

Here are some examples of built-in methods in JavaScript:

```javascript
"web".charAt(2);
"ruby is cool".match('cool');
4.5.toFixed();
var num = 4;  #note: this is assignment, not a method
num.toString();
```

These are all examples of **instance methods**, which means they are called on instances of objects (in this case objects of type `String` and `Number`). The general syntax to call an instance method is:

```javascript
someObject.methodName(argumentOne, argumentTwo);
```

Note that we still have to affix the parens `()` even if the method is called without any arguments. Without the parens, JavaScript interprets your method as a *property* instead.

Visually we think of a method as a black box where the arguments are input values which are processed by the method and an value is returned. The black box represents the fact that to use a method we only need to know the input and the output and not the statements inside that process the input.  This is the principle of encapsulation that is key to writing clean, reusable code.

### Method Chaining

Often we need to call more than one method on an object.  For example we may want to `concat()` and `toUpperCase()` a `String` object.  If we try to do this in two separate statements it doesn't work because `String` methods in JavaScript are non-destructive. Try it yourself in the browser console:

```javascript
var myString = "i like programming";
myString.concat(" and sushi.");
myString.toUpperCase();
```

We can get around this by assigning another variable:

```javascript
var myString = "i like programming";
var newString = myString.concat(" and sushi.");
newString.toUpperCase();
```

But this just adds a lot of extra code.  Chaining allows us to call multiple methods on the same object by stringing them together.  The methods are called in order, so `concat()` is called first and then `toUpperCase()` is called second.

```javascript
var myString = "i like programming";
myString.concat(" and sushi.").toUpperCase();
```

### Syntactic Sugar

Ruby is famous for its readable code. JavaScript, not as much. While Ruby allows for all sorts of "syntactic sugar", JavaScript is usually a bit stricter about requiring statements to be written out with precise formatting: semicolons at the ends of statements, parens for holding arguments and invoking functions, etc.

However, JavaScript does let us write arithmetic operations in a familiar way, without having to explicitly write out the method calls as `.methodName()`. Just like in Ruby, the standard operations are also methods:

```javascript
5 + 7;
3 * 2;
10 / 5;

// ... is the same as ...
5.+(7);
3.*(2);
10./(5);
```

JavaScript also preserves the usual order of operations when using the "syntactic sugar" way of writing operations (i.e., multiplication before addition, etc.), as you would expect.

```javascript
5 + 4 * 3;
```

Attempting to do this same operation using method chaining actually throws an error:

```javascript
5.+(4).*(3);
```

Of course, we can always use parentheses to explicitly define the order of operations we desire:

```javascript
(5 + 4) * 3;
```

### References

[MDN: JavaScript Reference: Global Objects](https://developer.mozilla.org/en-US/docs/JavaScript/Reference/Global_Objects)
