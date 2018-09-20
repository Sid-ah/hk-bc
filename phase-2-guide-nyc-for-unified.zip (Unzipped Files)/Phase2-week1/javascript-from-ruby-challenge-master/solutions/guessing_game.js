/*
// begin:intro
Create a `GuessingGame` constructor function which is initialized with an integer called `answer`.

Define an function for the constructor `GuessingGame.guess()` which takes an integer called `guess` as its input. `guess` should return the string `'high'` if the `guess` is larger than the `answer`, `'correct'` if the `guess` is equal to the `answer`, and `'low'` if the `guess` is lower than the `answer`.

Define an instance method `GuessingGame.isSolved()` which returns `true` if the most recent `guess` was correct and `false` otherwise.

For example,

```javascript
var game = new GuessingGame(10);

game.isSolved();   // => false

game.guess(5);     // => 'low'
game.guess(20);    // => 'high'
game.isSolved();   // => false

game.guess(10);    // => 'correct'
game.isSolved()    // => true
```

Or

```javascript
var game = new GuessingGame(Math.floor(Math.random() * 50) );
var lastGuess  = null;
var lastResult = null;

while (game.isSolved() === false) {
  if (lastGuess !== null) {
    console.log("Oops!  Your last guess " + lastGuess + " was " + lastResult + ".")
  }
  
  lastGuess   = prompt("Enter your guess: ");
  lastResult  = game.guess(lastGuess);
}

console.log(lastGuess + " was correct!");
```
// end:intro

// begin:hint
// end:hint

// begin:initial_code
var GuessingGame = function(answer) {
  // Your code here!
};
// end:initial_code

// begin:wrapper_code
// end:wrapper_code
*/

// begin:solution
var GuessingGame = function(answer) {
  var answer = answer;
  var solved = false;
  
  this.guess = function(n) {
    solved = false;
    
    if (n < answer) { 
      return 'low'; 
    } else if (n > answer) {
      return 'high';
    } else {
      solved = true;
      return 'correct';
    }
  };
  
  this.isSolved = function() {
    return solved;
  };
};
// end:solution

// begin:spec
describe("GuessingGame", function() {
  var game;
  
  beforeEach(function() {
    game = new GuessingGame(10);
  });
    
  describe("guess()", function() {
    it("is defined", function() {
      expect(game.guess).toBeDefined();
    });
    
    it("expects a single argument", function() {
      expect(GuessingGame.length).toBe(1);
    });
    
    it("returns 'high' when the guess is too high", function() {
      expect(game.guess(100)).toEqual('high');
    });
    
    it("returns 'low' when the guess is too low", function() {
      expect(game.guess(0)).toEqual('low');
    });
    
    it("returns 'correct' when the guess is correct", function() {
      expect(game.guess(10)).toEqual('correct');
    });
    
    it("changes isSolved() when a correct guess is made", function() {
      expect(game.isSolved()).toBe(false);
      game.guess(10);
      expect(game.isSolved()).toBe(true);
    });
    
    it("doesn't change isSolved() when an incorrect guess is made", function() {
      expect(game.isSolved()).toBe(false);
      game.guess(5);
      expect(game.isSolved()).toBe(false);
    });
    
    it("reflects the last guess", function() {
      game.guess(10);
      expect(game.isSolved()).toBe(true);
      game.guess(5);
      expect(game.isSolved()).toBe(false);
    });
  });
  
  describe("isSolved()", function() {
    it("is defined", function() {
      expect(game.isSolved).toBeDefined();
    });
    
    it("expects no arguments", function() {
      expect(game.isSolved.length).toBe(0);
    });
    
    it("returns false before a guess is made", function() {
      expect(game.isSolved()).toBe(false);
    });
  });
});
// end:spec