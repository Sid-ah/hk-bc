# Functions vs. Methods

JavaScript, unlike Ruby, does not have an explicit notion of a _method_. In JavaScript, there are only functions. However, some JavaScript programmers still refer to methods when they are talking about functions that are stored as the property of an object. This section will cover some of the characteristics of each and how to recognize one from the other.

#### What is a Function?

The best definition of a **function** is "a chunk of code that does stuff". Often we give these chunks of code a name to help us humans understand what kind of stuff the function does. If that's not good enough for you, then maybe you'd prefer the definition from MDN:

> Generally speaking, a function is a "subprogram" that can be called by code external (or internal in the case of recursion) to the function. Like the program itself, a function is composed of a sequence of statements called the function body.  Values can be passed to a function, and the function can return a value. [Link to source](https://developer.mozilla.org/en/JavaScript/Reference/Functions_and_function_scope)

Access to functions is determined by the scope in which they were defined. If you define a function in the global scope, it will be available throughout your program. If you define it within an object or another function, it will only be available from within the context of that object or function.

#### What is a Method?

We use the word **method** to refer to a function that is defined within the context of an object. For example, `#upcase` is a method defined for all instances of the `String` class in Ruby.

Here's how [Wikipedia defines methods](http://en.wikipedia.org/wiki/Method_(computer_programming):

> In object-oriented programming, a method (or member function) is a subroutine (or procedure or function) associated with an object, and which has access to its data, its member variables.

In JavaScript, objects have properties. The nice thing is that objects can store functions in their properties, and then we can execute the function stored there.

For example, `toUpperCase()` is a method defined by the `String` object. It will only work when called on a string object, as in `"banana".toUpperCase()`.

If we deconstruct the above example, we can pull it out into three parts:

1. `"banana"` is a `String` object. We could also create it with `new String('banana')`.
2. `toUpperCase` is a property of the `String` object. When we reference this property, it returns a function.
3. `()` means _execute this function_.

Let's make one thing very clear: **JavaScript does not have methods in the same way that Ruby has methods**. Instead, JavaScript has [first-class functions](http://en.wikipedia.org/wiki/First-class_function) which means that you can assign functions to variables and object properties. In practice, this looks and works in a similar manner to how methods work in Ruby (and many other object-oriented languages, for that matter). In JavaScript, a method is merely a function that is assigned to the property of an object.

JavaScript defines methods for its core global objects (`String`, `Array`, `Object`, etc.) which we can use on any objects of that type. In a browser environment, there are a vast number of other methods JavaScript provides for working with objects like `document`, `window`, `location`, and more.

You can also define your own methods for built-in objects or for new objects of your own design.
