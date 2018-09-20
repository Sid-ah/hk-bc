/*
// begin:intro
Implement a function called `timesTable()` which takes as its input an integer and prints out a times table with that number of rows.

The numbers can be separated by any spaces or tabs, but each row must be on a new line.  This means it's ok if the columns don't line up.

For example, `timesTable(5)` should print the following out to the screen:

```javascript
1  2  3  4  5
2	 4  6	 8  10	
3	 6  9  12 15	
4	 8  12 16 20	
5  10 15 20 25
```

Again, you don't need to worry about the spacing between columns.
// end:intro

// begin:hint
You'll need two loops, one nested in the other
// end:hint

// begin:initial_code
var timesTable = function(rows) {
  // Your code here!
};
// end:initial_code
*/

// begin:solution
var timesTable = function(rows) {
  var toPrint = "";
  
  for (var row=1; row <= rows; row++) {
    for (var col=1; col <= rows; col++) {
      toPrint += (row*col).toString();
      toPrint += "\t";
    }
    toPrint += "\n";
  }
  
  console.log(toPrint);
};
// end:solution

// begin:spec
describe("timesTable", function() {
  // This is a crazy regular expression which matches the output
  // of the 5x5 times table in a way that doesn't care how you
  // separate columns, so long as they're separated by whitespace
  var regexFive = /1\s+2\s+3\s+4\s+5\s*\n2\s+4\s+6\s+8\s+10\s*\n3\s+6\s+9\s+12\s+15\s*\n4\s+8\s+12\s+16\s+20\s*\n5\s+10\s+15\s+20\s+25\s*$/m;

  var output = "";
  console = {
    log: function(text) {
      output = text; 
    }
  };
  
  it("prints nothing when called with 0", function() {
    timesTable(0);
    expect(output.length).toEqual(0);
  });
  
  it("correctly prints a 1x1 times table", function() {
    timesTable(1);
    expect(output).toMatch(/1\s*$/);
  });
  
  it("correctly prints a 5x5 times table", function() {
    timesTable(5);
    expect(output).toMatch(regexFive);
  });
});
// end:spec