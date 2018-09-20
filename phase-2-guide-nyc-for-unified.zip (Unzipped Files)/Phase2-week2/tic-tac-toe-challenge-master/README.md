# Tic Tac Toe 
 
##Learning Competencies 

##Summary 

 Let's build a multi-player, web-based tic-tac-toe game.  No, scratch that: the *ultimate Tic-Tac-Toe tournament*.

This application has a strong front-end component.

## Objectives

### Models

We have two models: `User` and `Game`.  Each `Game` has exactly two players.

### User Flow

To start, we'll require that users sign up before they can do anything on the site.  Once signed up, they see a "lobby" of sorts, showing a list of players who are waiting for challengers.  Additionally there's an option for a user to start a new game and wait for someone else to join theirs.

Once two people have joined, the game commences, until one player wins or its a draw.  Each player should have a homepage showing their scores.

A logical divide in this application is the front end, which will be largely JavaScript, and the back-end, which will be a sort of "Tic Tac Toe API" written in Sinatra. This approach, however, has disadvantages, since:

1. If you split the project this way, you'll only get to practice _part_ of what you learned this phase.
2. It will be easy for the two teams to diverge.

A better approach might be to:

1. Create a [Trello](http://www.trello.com/) board with [user stories](http://en.wikipedia.org/wiki/User_story) that you can prioritize in order to reach an MVP.
2. Have each team pull stories one at a time off the board to implement.

No matter which approach you use, be sure to focus on writing clean object-oriented JavaScript for the front-end pieces.

### Advanced Features

If you want to stretch yourself even more, here are some ideas:

* Allow "anonymous" users to join and play without signing up
* Record a history of each move so that individual games can be replayed
* Add more turn-based games like [Reversi](http://en.wikipedia.org/wiki/Reversi), [Connect Four](http://en.wikipedia.org/wiki/Connect_Four), or [Hex](http://en.wikipedia.org/wiki/Hex_(board_game)). 

##Releases
###Release 0 

##Optimize Your Learning 

##Resources