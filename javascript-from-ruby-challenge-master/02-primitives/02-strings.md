# Strings

A string is a collection of characters, just like in Ruby. These can be letters, symbols or numbers.  Here are some strings in JavaScript:

```javascript
"JavaScript is cool"
'Models, Views & Controllers'
var name = "Bob";
name + ' ' + "Smith"
"123"
"23" + '15'
```

When working with numbers in strings, the numbers are treated as symbols, so adding two numeric strings works like adding two non-numeric strings in that it just concatenates the symbols.  In Ruby, the `*` symbol can also be used with strings, but not so in JavaScript. Try it:

```javascript
"Hello" * 4;
```

What's `NaN`, you may ask? That's just JavaScript telling you that `"Hello"` is **Not a Number**. Because it is not a number. It's a string. Thank you, JavaScript.

###Escaping and Special Characters

Just like Ruby, there are special characters in JavaScript that can be used in strings by using the escape character or backslash `\`.

```javascript
"This is a newline \n it puts strings on a new line"
"You\'re using strings"
"Even the backslash ( \\ )is escaped."
```

But will the special characters work within single-quoted strings? JavaScript is slightly different from Ruby in this regard.

```javascript
'This is a newline \n it puts strings on a new line'
'You\'re using strings'
'Even the backslash ( \\ )is escaped.'
```

There are lots of methods available for the String object which you can read about on the  [MDN page](https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/String). Let's look at a few:

```javascript
"I like to code".indexOf('i');
"go team".toUpperCase();
'apples and oranges'.substr(4, 9);
'Hello'.concat(' World!');
```

You will notice that none of the string methods in JavaScript are destructive - i.e. they will never modify the object they are called on, but will always return a new object instead. In Ruby, there are destructive string methods like `capitalize!` that *will* modify the source object. Ruby uses the `!` bang symbol to notify us of these properties. In JavaScript, there is no such convention for desctructive methods. We needn't fret since we won't be encountering destructive methods in JavaScript until we get to the section on Collections.

###Resources

[MDN: JavaScript Data Structures](https://developer.mozilla.org/en/JavaScript/Data_structures)<br>
[MDN: JS Reference: Strings](https://developer.mozilla.org/en/JavaScript/Reference/Global_Objects/String)
