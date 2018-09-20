/*
// begin:intro
Write a function `countBetween()` which takes three arguments as input:

1. An `Array` of integers
2. An integer lower bound
3. An integer upper bound

`countBetween()` should return the number of integers in the `Array` between the two bounds, including the bounds.

It should return `0` if the `Array` is empty.

Some examples:

```javascript
countBetween([1,2,3], 0, 100);      // => 3
countBetween([-10, 1, 2], 0, 100);  // => 2
countBetween([10, 20, 30], 10, 30); // => 3
countBetween([], -100, 100);        // => 0
countBetween([0], 0, 0);            // => 1
```
// end:intro

// begin:hint
// end:hint

// begin:initial_code
var countBetween = function(array, lowerBound, upperCount) {
  // Your code goes here!
};
// end:initial_code

// begin:wrapper_code
// end:wrapper_code
*/

// begin:solution
function countBetween(array, lowerBound, upperBound) {
  var count = 0;
  array.forEach(function (element) {
    if ((element >= lowerBound) && (element <= upperBound)) {
      count += 1;
    }
  });
  return count;
}
// end:solution

// begin:spec
describe("countBetween()", function() {
  it("returns 0 for an empty array", function() {
    expect(countBetween([], -100, 100)).toEqual(0);
  });

  it("returns 0 if upperBound < lowerBound", function() {
    var array = [1,2,3,4,5,6,7,8,9,10];
    expect(countBetween(array, 100, -100)).toEqual(0);
  });

  it("returns the count if lowerBound == upperBound", function() {
    expect(countBetween([1,1,1], 1, 1)).toEqual(3);
  });

  it("doesn't count integers below the lower bound", function() {
    expect(countBetween([-10, 1, 2], 0, 100)).toEqual(2);
  });

  it("doesn't count integers above the upper bound", function() {
    expect(countBetween([1, 2, 200], 0, 100)).toEqual(2);
  });

  it("returns the size of the array if the array is inside the bounds", function() {
    // A random 100-element array
    var array = []
    for (var i=0; i < 100; i++) { array.push(Math.floor(Math.random() * 101) - 50) }

    expect(countBetween(array, -50, 50)).toEqual(100);
  });
});
// end:spec
