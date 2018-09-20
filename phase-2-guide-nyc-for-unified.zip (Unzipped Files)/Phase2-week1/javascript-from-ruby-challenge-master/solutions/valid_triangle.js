/*
// begin:intro
Write a function `validTriangle()` which takes as its input three non-negative numbers.  It should return `true` if the three numbers could form the side lengths of a triangle and `false` otherwise.

The arguments don't correspond to specific sides.  Don't worry about handling negative inputs: garbage in, garbage out.

For example,

```javascript
validTriangle(0,0,0) # => false, because a triangle can't have 0-length sides

validTriangle(1,1,1) # => true, an equilateral triangle

validTriangle(3,4,5) # => true, a right triangle
validTriangle(4,3,5) # => true, the same right triangle
validTriangle(5,3,4) # => true, the same right triangle

validTriangle(10, 10, 100) #=> false, no such triangle exists
```

You might want to read [this Wikipedia article about Pythagorean triples](http://en.wikipedia.org/wiki/Pythagorean_triple).
// end:intro

// begin:hint
// end:hint

// begin:initial_code
var validTriangle = fucntion(a, b, c) {
  // Your code goes here!
};
// end:initial_code

// begin:wrapper_code
// end:wrapper_code
*/

// begin:solution
var validTriangle = function(a, b, c) {
  var sorted = [a,b,c].sort();
  
  return (sorted[0] + sorted[1]) > sorted[2];
};
// end:solution

// begin:spec
describe("validTriangle()", function() {
  var pythagoreanTriple = [65, 72, 97];
  
  it("is defined as a function", function() {
    expect(typeof validTriangle).toBe('function');
  });
  
  it("expects three arguments", function() {
    expect(validTriangle.length).toBe(3);
  });
  
  it("returns true for an equilateral triangle", function() {
    expect(validTriangle(10,10,10)).toBe(true);
  });
  
  it("returns false if any of the arguments are 0", function() {
    expect(validTriangle(1,1,0)).toBe(false);
    expect(validTriangle(1,0,1)).toBe(false);
    expect(validTriangle(0,1,1)).toBe(false);
  });
  
  it("returns true for permutations of a Pythagorean triple", function() {
    expect(validTriangle.apply(this, pythagoreanTriple)).toBe(true);
    expect(validTriangle.apply(this, pythagoreanTriple.reverse())).toBe(true);
    expect(validTriangle(pythagoreanTriple[1], pythagoreanTriple[2], pythagoreanTriple[0])).toBe(true);
  });
});
// end:spec