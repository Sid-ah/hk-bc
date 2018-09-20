/*
// begin:intro
Write a `factorial()` function which takes as its input a non-negative integer and calculates the factorial of that number.

The factorial of a number is the product of all integers from `1` up to that number.  For example:

```javascript
factorial(5) == 5 * 4 * 3 * 2 * 1 == 120
```

The factorial of `0` is defined to be `1`.

See [the Wikipedia article on the factorial](http://en.wikipedia.org/wiki/Factorial) for more information.
// end:intro

// begin:hint
// end:hint

// begin:initial_code
var factorial = function(n) {
  // Your code here!
};
// end:initial_code

// begin:wrapper_code
// end:wrapper_code
*/

// begin:solution
function factorial(n) {
  return n <= 1 ? 1 : factorial(n - 1);
}
// end:solution

// begin:spec
describe("factorial", function() {
  it("returns 1 with 0 as an argument", function() {
    expect(factorial(0)).toEqual(1);
  });

  it("returns 1 with 1 as an argument", function() {
    expect(factorial(1)).toEqual(1);
  });

  it("calculates 10!", function() {
    expect(factorial(10)).toEqual(3628800);
  });

  it("calculates 20!", function() {
    expect(factorial(20)).toEqual(2432902008176640000);
  });
});
// end:spec
