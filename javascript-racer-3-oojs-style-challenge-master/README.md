# JavaScript Racer 3 OOJS Style JavaScript

## Learning Competencies

* Map the flow of data through a web application
* Implement CRUD in an MVC application
* Implement a functional JavaScript application
* Change the DOM based on events
* Use AJAX actions to change views based on async data
* Write OO-JavaScript

## Summary

Using your JavaScript Racer program, let's refactor the front-end code to use
proper object-oriented JavaScript.  Instead of having code that is highly
dependent on your DOM, lots of global state, and JavaScript strewn about your
callbacks, we'll write code that works like this:

```javascript
$(document).ready(function() {
  var player1 = new Player("jim");
  var player2 = new Player("anne");

  var game = new Game(player1, player2);

  $(document).on('keyup', function(event) {
    game.onKeyUp(event.which);
  });
});
```

Won't that be jolly!

If you haven't implemented the back-end for JavaScript racer, do that first.

The goal here is to learn about object-oriented programming using JavaScript.
The way JavaScript achieves the same effects as equivalent Ruby code will seem
strange at first, but having a solid understanding of this will help you write
maintainable, readable JavaScript.

This will be challenging.  Don't sweat it!

## Releases

### Release 0: Prepare

Start by reading the basics of JavaScript objects.  Here are some good resources:

* [Introduction to Object-Oriented JavaScript][]
* [The Basics of Object-Oriented JavaScript][]


This list isn't exhaustive and you'll see that the recommendations of these
articles all vary slightly.  Unlike Ruby, there's much less standardization
around style in the JavaScript world.  Pick one and be consistent.  You can
refine your techniques later; for now get the fundamentals.

Can you define a new object with properties and methods?  Can you create
getters and setters?

### Release 1: The `Game` and `Player` Functions

Create the `Game` and `Player` functions (calls constructors in JavaScript)
which will encapsulate the overall game state and the player state,
respectively.

This will let us do a few things:

1. Game state is kept separate from the DOM
2. We can keep track of game-wide state like time played and victory conditions
3. We can keep track of player-specific state like current position

Define a `render` method like so, to keep the "display" concern cleanly
separated from the game bookkeeping concerns:

```javascript
Game.prototype.render = function() {
  // Updates DOM to reflect current game state
  // Does not modify game state at all
}
```

Feel free to create `player.js` and `game.js` files and include them in your
application.

### Release 2: Refactor

Focus on making your JavaScript clean.  For example, perhaps there are
`game.start` and `game.finish` methods which might fire off AJAX requests to
the server.

After you're done, make sure you get feedback from staff on the code.  This is
one of the more important challenges and understanding how object-oriented
JavaScript works is a key skill.

<!-- ## Optimize Your Learning -->

## Resources

* [Introduction to Object-Oriented JavaScript][]
* [The Basics of Object-Oriented JavaScript][]

[Introduction to Object-Oriented JavaScript]: https://developer.mozilla.org/en-US/docs/JavaScript/Introduction_to_Object-Oriented_JavaScript
[The Basics of Object-Oriented JavaScript]: http://net.tutsplus.com/tutorials/javascript-ajax/the-basics-of-object-oriented-javascript/
