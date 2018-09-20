# Javascript Racer 1 Front End

## Learning Competencies

* Define [jQuery][] callback events
* Change the DOM based on events
* Write custom event handlers in JavaScript and jQuery
* Build a pure JavaScript application 
* Write OO-JavaScript

## Summary

Let's create a JavaScript-only version of [Ruby Racer][].  For now it will be a
single html page with no back-end at all.  Later we'll add the ability to save
high scores and the like by adding a back-end to the application.

Unlike Ruby Racer, the outcome of the game won't be pure chance.  Each player
will advance their "car" by smashing some key.  For example, player 1 might be
the "q" key and player 2 might be the "p" key.

The goal here is to learn more about JavaScript, jQuery, the DOM, and
asynchronous event handling.

Before you start, you should read about [jQuery][].  In particular, you should
understand event handling and callback functions.

## Releases

### Release 0: The Setup

There is no skeleton for this challenge.  You will have to write the HTML, CSS and JavaScript files yourself (and link them all together).  Let's just start with building a simple two-player board.  This will be
rendered via HTML.  There are a few ways you could do it, e.g., a table that
looks like:

```html
<table class="racer_table">
  <tr id="player1_strip">
    <td></td>
    <td class="active"></td>
    <td></td>
    <td></td>
    ... etc ...
  </tr>
  <tr id="player2_strip">
    <td></td>
    <td></td>
    <td></td>
    <td class="active"></td>
    ... etc ...
  </tr>
</table>
```

Then, using CSS, you can provide styles like:

```css
.racer_table td {
  background-color: white;
  height: 20px;
  width: 20px;
}

.racer_table td.active {
  background-color: black;
}
```

Updating a player's position could be achieved by adding the `active` class to
the appropriate `td`.  There are many other ways to achieve a sensible board
output; this is just one suggestion.

Make sure you're able to "manually" produce all the board layouts you might
care about before you jump into the JavaScript.  Whatever way you choose, it
should be easy for jQuery/JavaScript to manipulate, so keep that in mind.

Use something like [normalize.css][] to enable sane default styles.

### Release 1: Add JavaScript

We need some way for JavaScript to update the board state.  Create simple
JavaScript functions that can update a particular player's position.  You give
the functions a player position as input and they update the underlying HTML to
reflect the new position.

It could look something like:

```javascript
update_player_position('player1', 10);
```

Store this JavaScript in a separate file and use the JavaScript console to
debug it and pass in values manually.

### Release 2: Binding to Key Presses

Now we'll make the game interactive!  Bind to the [keyup][] event to detect
when a player has "pressed" a key.  We don't bind to the [keydown][] or
[keypress][] events because those events fire when the keyboard repeats the
key, whereas the keyup event doesn't.

It'd be a boring game if you could just hold the key and go.  You want to bind
to the `document`, like so:

```javascript
$(document).ready(function() {
  $(document).on('keyup', function(event) {
    // Detect which key was pressed and call the appropriate function
    // Google "jquery keyup what key was pressed" if you don't know how
  });
});
```

### Release 3: Starting and Winning States

The last bit is to have starting and winning states, so we can restart the game
and declare a winner when the game is over.  Add these features (starting,
playing, winning, and restarting) and submit your solution as a pull request
with at least three files: an HTML file, a CSS file, and a JavaScript file.
You can have more files, but all CSS and JavaScript should be linked externally
from the HTML file.

<!-- ## Optimize Your Learning -->


## Resources

* [Ruby Racer][]
* [jQuery][]
* [normalize.css][]
* [Moxilla documentation for: keyup][keyup]
* [Moxilla documentation for: keydown][keydown]
* [Moxilla documentation for: keypress][keypress]


[Ruby Racer]: ../../../ruby-racer-1-outrageous-fortune-challenge
[jQuery]: http://learn.jquery.com/about-jquery/
[normalize.css]: http://necolas.github.com/normalize.css/
[keyup]: http://api.jquery.com/keyup/
[keydown]: http://api.jquery.com/keydown/
[keypress]: http://api.jquery.com/keypress/
