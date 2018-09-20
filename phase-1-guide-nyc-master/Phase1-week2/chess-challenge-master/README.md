# Chess
Build a command line chess game with object oriented programming.

## Quick overview of chess rules

[Chess](http://en.wikipedia.org/wiki/Chess) is played on a 8x8 board.
The players are given colors, black and white.
The goal of the game is to [checkmate](http://en.wikipedia.org/wiki/Checkmate)
the other player, putting them into a situation where their king is threatened
with capture and cannot escape.

Each player begins play with:
  * 1 [king](http://en.wikipedia.org/wiki/King_(chess))
  * 1 [queen](http://en.wikipedia.org/wiki/Queen_(chess))
  * 2 [rooks](http://en.wikipedia.org/wiki/Rook_(chess))
  * 2 [knights](http://en.wikipedia.org/wiki/Knight_(chess))
  * 2 [bishops](http://en.wikipedia.org/wiki/Bishop_(chess))
  * 8 [pawns](http://en.wikipedia.org/wiki/Pawn_(chess))

Each type of piece [moves differently](http://en.wikipedia.org/wiki/Chess#Movement).

## Summary

Today, let's build a command line chess game. Here's an example of the start
of a game:

*(Note: the ASCII art may be a little misaligned in the browser).*

    $ ruby chess.rb 
    8  ♜  ♞  ♝  ♛  ♚  ♝  ♞  ♜
    7  ♟  ♟  ♟  ♟  ♟  ♟  ♟  ♟
    6 
    5 
    4 
    3 
    2  ♙  ♙  ♙  ♙  ♙  ♙  ♙  ♙
    1  ♖  ♘  ♗  ♕  ♔  ♗  ♘  ♖
       a  b  c  d  e  f  g  h 
    white's turn.
    white, your move? d2
    moves for white pawn d2: d3, d4
    white, move d2 where? d4

    Ok, white's pawn d2 to d4.

If a capture is available, the program says so when it lists the move:

    8  ♜  ♞  ♝  ♛  ♚  ♝  ♞  ♜
    7  ♟  ♟  ♟     ♟  ♟  ♟  ♟  
    6                          
    5           ♟              
    4           ♙  ♙           
    3                          
    2  ♙  ♙  ♙        ♙  ♙  ♙  
    1  ♖  ♘  ♗  ♕  ♔  ♗  ♘  ♖  
       a  b  c  d  e  f  g  h 
    black's turn.
    black, your move? d5
    moves for black's pawn d5: e4
    black, move d5 where? e4

    Ok, black's pawn d5 captures white's pawn e4.

And on and on until:

    8
    7
    6                          
    5
    4 
    3     ♚                     
    2              ♜
    1     ♔        ♘
       a  b  c  d  e  f  g  h 
    black's turn.
    black, your piece? e2
    moves for black's rook e2: a2, b2, c2, d2, f2, g2, h2, e1, e3, e4, e5, e6, e7, e8
    black, move e2 where? e1

    Ok, black's pawn e2 to capture white's knight e1. Checkmate.


## Release 0 — Design

Your first task is to figure out how to model chess. Let's think about what we
need to do:

  * We need code to keep track of what's on the board. A
    `Board` class sounds like a good place for that.
  * We need to store the rules for how pieces move. Each piece in
    chess moves differently, and not in a particularly structured way, so having a
    class for each type of piece—`Pawn`, `Bishop`, `Knight`, `Rook`, `King`,
    and `Queen`—will probably work well here.
  * Finally, we need something to handle the REPL—getting input from the user and printing
    the board. A `Game` class would be a good place to keep this code.

You should figure out what the responsibilities of each of these classes are, and
ultimately describe what methods they need.

A good way to start breaking this down is with user stories. Here's an example.

*"After entering a position (at the 'your piece?' prompt), I should see a numbered
list of moves so I can pick one."*

The breakdown might look like this:

  * `Game` gets a `board_position` from the user.
  * `Game` asks `Board` for `moves` for the `user`
    at the `board_position`
  * `Board` finds the `Piece` at that position. If there is no
    `Piece` at that position, or the `Piece` does not belong to `user`,
    `Board` replies to `Game` with an empty list of moves.
  * `Board` asks the `Piece` for a list of its `moves`
  * `Board` filters the list of `moves` to only those which are allowed
    given the current state of the board
  * `Board` returns the list of `moves` to `Game`
  * `Game` presents the list to the user and says, "`user`, your move?"

It will really, really help to draw this out on a whiteboard with your group.
We'll also do some design together in class.

Remember: pick the internal representation that makes things easiest for you
as a programmer.

You don't have to know the specifics of how chess pieces move at this point,
but there are two facts you may want to keep in mind:  

  * Some pieces can jump over other pieces.
  * Some pieces can turn into other pieces.

## Release 1 — Interfaces

After you've designed the parts of your chess program, solidify that design
by writing the interfaces for each class. That means you'll list the method
each class has, what arguments those methods take, what they return, and what
side effects they have.

For example,

    class Piece
      # Takes a position (an array [row:0..7, col:0..7]) and
      # returns true if it is a valid movement for this piece from its
      # current position, false otherwise.
      def can?(pos)
      end

      # Returns an enumerable of moves (instances of Move) for this
      # piece from its current position. May return moves which are off
      # the board or overlap other pieces.
      def moves()
      end

      # ...etc...
    end

Be this specific and this precise. Note how I'm not just saying that the
`can?` method takes a position, I am also describing what a position is. It's
an array with two items, the first one is the row, the second is the column,
and they are both in the range 0..7. I am using particularly geeky notation
for this. You don't have to use my notation, but you should be just as
descriptive. If you are precise and specific now, it will help you avoid bugs
later when you try to call `can?` with an array of `['d', 6]`.

Likewise, be specific about when a method is allowed to return invalid values.
In this case, I've decided that `Piece`s can return moves which are off the
board or overlap other pieces.

You don't have to write interfaces for any class which has the same interface
as another. For example, once you've written the interface for the `Piece`
class, `Queen`, `Pawn`, `Knight`, and so on will all have the same interface (even
though they will have different behavior).

## Release 2 — Specs

Write specs that test the interfaces you just wrote.

You don't have to write specs to test anything else—for example,
the correct movement of particular pieces.

You can break up this work: have some of your group write some specs, and have
others write other specs. After you're done, come back and compare notes.

If you discover that it's very difficult to write specs, call your group
back together and discuss changing the interface. If it's difficult to write
specs for, it will be difficult to debug. That's not a hard and fast rule in
programming, but it's often true, and I think it's true for this program.

## Release 3 — Implementation

Now that you know what the code you're writing needs to do, break it
up and write it.

Again, if you find that the interface needs to a class needs to change,
call your group back together to discuss it. 

Here are some things you **don't** need to worry about right now:

  1. Pawns can capture [en passant](http://en.wikipedia.org/wiki/En_passant).
     Don't worry about that.
  2. Pawns can also be [promoted](http://en.wikipedia.org/wiki/Promotion_(chess))
     to any other piece 
  3. Kings can [castle](http://en.wikipedia.org/wiki/Castling). Don't worry about it.
  4. [Stalemate](http://en.wikipedia.org/wiki/Stalemate) happens when one player is
     not in check (her king is not being immediately threatened), but she has no 
     legal moves. Don't worry about it.
  5. [Threefold repetition](http://en.wikipedia.org/wiki/Threefold_repetition) of
     a board position results in a draw. Don't worry about it.
  6. If no pawn has moved and no capture has occurred in
     [50 moves](http://en.wikipedia.org/wiki/Fifty-move_rule), either player may
     claim a draw. Don't worry about it.
  7. If one player has
     [insufficient material](http://en.wikipedia.org/wiki/Glossary_of_chess#Insufficient_material)
     to win despite being ahead, the other player may claim a draw. Don't worry about it.


## Release 4 — Advanced chess movement

See all those things I told you not to worry about? Please worry about them now,
in the order listed above.

## Conclusion

Chess is hard. Have some tea.

This challenge is primarily designed to teach you the value in developing
clear, precise interfaces and clear, precise responsibilities. Nearly every
programmer in the world will agree on this. We won't agree on which programming
language, text editor, or indentation style to use, but we will agree that
solid interfaces make for solid programs.

I'm putting in some extensions here if you're still interested in working on 
this project. I'm really letting myself go crazy with some of them. Please don't
be intimidated—I would find it challenging to implement most of these.

## Extension 1 — Improve UI

Take a moment to look at your program from the stance of a user and decide what
would make it a little more beautiful. For example, maybe you want the pieces to
be on a chessboard with light and dark tiles? Or maybe you'd like to be able to
state your moves in [algebraic notation](http://en.wikipedia.org/wiki/Algebraic_notation_(chess))
 (we're already most of the way there).

## Extension 2 — Fairy Chess

Add support for [Fairy chess](http://en.wikipedia.org/wiki/Fairy_chess_piece) pieces.

In doing this, you will probably find that you can generalize your chess movement
a bit.

## Extension 3 — A two year old chess player

Write an AI for your chess program that plays by making random legal moves.

## Extension 4 — A six year old chess player

Write an AI that learns how to play chess by reading a
[corpus](http://sourceforge.net/p/scid/wiki/GetResources/) of chess data and training
a machine learning algorithm on it.

A way of conceptualizing this problem is: given a
[graph](http://en.wikipedia.org/wiki/Graph_%28abstract_data_type%29) in which the nodes
are occupied squares or squares which could become occupied in a single move and the
edges are moves, assign weights to the edges such that the edge with the highest weight
is the best move.

This conceptualization suggests some kind of repeated graph traversal, probably with
initial weights and periodic adjustments derived from training data.

There are [many](http://en.wikipedia.org/wiki/Computer_chess) approaches, and this
is a very very very hard problem.

## Extension 5 — The Polgár

Write an AI that wins at chess because it wants to.
