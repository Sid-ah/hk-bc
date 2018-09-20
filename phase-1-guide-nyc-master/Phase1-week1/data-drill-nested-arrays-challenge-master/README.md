# Data Drill: Nested Arrays

## Summary
Arrays are useful objects for storing collections of data: a list of numbers, strings, or what-have-you. They are fairly simple objects, and their flexibility leads to limitless possibilities for use.  One common design pattern we'll encounter is the *nested array*, an array whose elements are arrays themselves.  A list of lists, we could say.

```ruby
tic_tac_toe_board = [
  ["X", "X", "O"],
  ["O", "O", "X"],
  ["X", "O", "X"]
]

first_row = tic_tac_toe_board[0]
# => ["X", "X", "O"]

first_row_third_column = first_row[2]
# => "O"
```
*Figure 1*.  Representing a grid in a nested array data structure.

Nested arrays are handy for representing grids, like a [tic-tac-toe board](https://en.wikipedia.org/wiki/Tic-tac-toe) (see Figure 1).  We generally think of grids in terms of rows and columns.  Nested arrays are a data structure that closely mimics this thinking.  We can think of the elements inside the outer array as rows.  And the elements within the individual rows are column values.

If we wanted to get the first row of the grid, we can access the element at index 0.  Once we have that first row, then we can get the values in specific columns.  Figure 1 shows how we can access both the first row of the tic-tac-toe board and also how to get the value from the last column in that row.

In Figure 1, to get the value in the third column of the first row, we take the intermediary step of assigning the first row to a variable.  We then use the variable when we want to find the value of the third column.  We could eliminate this step and instead use method chaining:  `tic_tac_toe[0][2]`.

This summary has talked about accessing values in nested arrays.  Our task in this challenge is to build some nested arrays.


## Releases
### Release 0: Represent a Chessboard
```ruby
board = generate_chessboard
# => [ ... ]
board[7][0]
# => "W Rook"
```
*Figure 2*.  Generating a chessboard and accessing the piece in the first column of the last row.


The first nested array structure that we want to produce is a [chessboard](https://en.wikipedia.org/wiki/Chess#Rules).  We'll write a `generate_chessboard` method that returns a nested array representing a chessboard.  Pieces should be represented as strings (e.g., `'W Knight'` or `'B Pawn'`) and be placed in their positions at the start of the game.  Empty spaces should be represented as `nil`.  Tests have been written to describe the board.  (See Figure 2 for method usage examples.)

Let's not make this more complicated than it needs to be; we just need to return the nested array.


### Release 1: Represent Tabular Data

| Number  | Name        | Position       | Points per Game      |
|---------|-------------|----------------|----------------------|
| 12      | Joe Schmo   | Center         | [14, 32, 7, 0, 23]   |
| 9       | Ms. Buckets | Point Guard    | [19, 0, 11, 22, 0]   |
| 31      | Harvey Kay  | Shooting Guard | [0, 30, 16, 0, 25]   |
| 18      | Sally Talls | Power Forward  | [18, 29, 26, 31, 19] |
| 22      | MK DiBoux   | Small Forward  | [11, 0, 23, 17, 0]   |

*Table 1*.  Roster data for a basketball team.

A nested array could also be used to represent a data table—similar to a spreadsheet—like we see in Table 1.  Again, we have data that maps well to rows and columns.

```ruby
roster = generate_roster
# => [ ... ]
roster[1]
# => [12, "Joe Schmo", "Center", [14, 32, 7, 0, 23]]
roster[1][2]
# => "Center"
roster[1][3]
# => [14, 32, 7, 0, 23]
roster[1][3][0]
# => 14
```
*Figure 3*.  Generating a roster data table and accessing values.

Let's write a `generate_roster` method that represents the data shown in Table 1 as a nested array.  As with the `generate_chessboard` method, this method only needs to return the specified nested array.  Tests have been provided to help us determine whether or not our method is behaving as desired. (See Figure 3 for method usage examples.)


## Conclusion
This challenge is designed to give us exposure to nested arrays.  What are they?  How can we use them to represent real-world data?  We'll encounter them as we continue through Dev Bootcamp.
