/*
// begin:intro
Write four functions that take a `rectangle` object:

1. `area(rectangle)`, which returns the area of the rectangle
2. `perimeter(rectangle)`, which returns the perimeter of the rectangle
3. `diagonal(rectangle)`, which returns the length of the rectangle's diagonal
4. `isSquare(rectangle)`, which returns `true` if the rectangle is a square and `false` otherwise

A few sample rectangle objects have been written for you below.  Assume that all rectangle objects will have a `width` and `height` property.
// end:intro

// begin:hint
You may want to read [this article on rectangle diagonals](http://www.mathopenref.com/rectanglediagonals.html)
// end:hint

// begin:initial_code
var rectOne   = { width: 10, height: 20 };
var rectTwo   = { width: 32, height: 13 };
var rectThree = { width: 20, height: 10 };

var equal = function(rect1, rect2) {
  return ( (rect1.width  == rect2.width && rect1.height == rect2.height ) || 
           (rect1.height == rect2.width && rect1.width  == rect2.height ) );
};
// end:initial_code

// begin:wrapper_code
// end:wrapper_code
*/

// begin:solution
var equal = function(rect1, rect2) {
  return ( (rect1.width  == rect2.width && rect1.height == rect2.height ) || 
           (rect1.height == rect2.width && rect1.width  == rect2.height ) );
};

var area = function(rect) {
  return rect.width * rect.height;
};

var perimeter = function(rect) {
  return (rect.width * 2) + (rect.height * 2);
};

var diagonal = function(rect) {
  return Math.sqrt((rect.width * rect.width) + (rect.height * rect.height));
};

var isSquare = function(rect) {
  return rect.width === rect.height;
};
// end:solution

// begin:spec
describe("rectangle functions", function() {
  var rect    = { width: 10, height: 20 };
  var square  = { width: 20, height: 20 };
  
  describe("area()", function() {
    it("is defined", function() {
      expect(area).toBeDefined();
    });
    
    it("returns the correct area of a rectangle", function() {
      expect(area(rect)).toBe(200);
    });
    
    it("returns the correct area of a square", function() {
      expect(area(square)).toBe(400);
    });
  });
  
  describe("perimeter()", function() {
    it("is defined", function() {
      expect(perimeter).toBeDefined();
    });
    
    it("returns the correct perimeter of a rectangle", function() {
      expect(perimeter(rect)).toBe(60);
    });
    
    it("returns the correct perimeter of a square", function() {
      expect(perimeter(square)).toBe(80);
    });
  });
  
  describe("diagonal()", function() {
    it("is defined", function() {
      expect(diagonal).toBeDefined();
    });
    
    it("returns the correct diagonal of a rectangle", function() {
      expect(diagonal(rect)).toBe(22.360679774997898);
    });
    
    it("returns the correct diagonal of a square", function() {
      expect(diagonal(square)).toBe(28.284271247461902);
    });
  });
  
  describe("isSquare()", function() {
    it("is defined", function() {
      expect(isSquare).toBeDefined();
    });
    
    it("returns false for a rectangle", function() {
      expect(isSquare(rect)).toBe(false);
    });
    
    it("returns true for a square", function() {
      expect(isSquare(square)).toBe(true);
    });
  });
});
// end:spec