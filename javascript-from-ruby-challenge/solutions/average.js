/*
// begin:intro
Write four instance methods for `Array`:

1. `Array.total()`, which returns the total of all the values in the array
2. `Array.mean()`, which returns the mean of the array
3. `Array.median()`, which returns the median of the array
4. `Array.mode()`, which returns an object representing the mode(s) of the array with the property being the mode and the value being the frequency

Since you haven't covered extending built-in JavaScript objects, we've provided the shells of each method for you.  All you have to do is make them work.
// end:intro

// begin:hint
You may want to crack open a Math textbook!
// end:hint

// begin:initial_code
Array.prototype.total   = function() {
  // Your code here!
};

Array.prototype.mean    = function() {
  // Your code here!
};

Array.prototype.median  = function() {
  // Your code here!
};

Array.prototype.mode    = function() {
  // Your code here!
  // Ex. Mode array:
  // var mode = { 5:3, 6:3 }
};
// end:initial_code

// begin:wrapper_code
// end:wrapper_code
*/

// begin:solution
Array.prototype.total = function() {
  var total = 0;
  this.forEach(function (element) {
    total += element;
  });
  return total;
};

Array.prototype.mean = function() {
  return this.total() / this.length;
};

Array.prototype.median  = function() {
  var sorted = this.sort();

  if (this.length % 2 === 1) {
    return sorted[Math.floor(this.length/2)]
  } else {
    return (sorted[this.length/2 - 1] + sorted[this.length/2]) / 2
  }
};

Array.prototype.mode = function() {
  var modes, max, number, count;

  modes = {};
  this.forEach(function (element) {
    var count = modes[element] || 0;
    modes[element] = count + 1;
  });

  max = 0;
  for (number in modes) {
    count = modes[number];
    if (count > max) { max = count; }
  }

  for (number in modes) {
    if (modes[number] < max) { delete modes[number]; }
  }

  return modes;
};
// end:solution

// begin:spec
describe("Array", function() {
  var array1 = [1, 2, 3, 4, 5, 5, 7];
  var array2 = [4, 4, 5, 5, 6, 6, 6, 7];

  describe("total", function() {
    it("is defined", function() {
      expect(new Array().total).toBeDefined();
    });

    it("returns the correct total of array 1", function() {
      expect(array1.total()).toBe(27);
    });

    it("returns the correct total of array 2", function() {
      expect(array2.total()).toBe(43);
    });
  });

  describe("mean", function() {
    it("is defined", function() {
      expect(new Array().mean).toBeDefined();
    });

    it("returns the correct mean of array 1", function() {
      expect(array1.mean()).toBe(3.857142857142857);
    });

    it("returns the correct mean of array 2", function() {
      expect(array2.mean()).toBe(5.375);
    });
  });

  describe("median", function() {
    it("is defined", function() {
      expect(new Array().median).toBeDefined();
    });

    it("returns the correct median of array 1", function() {
      expect(array1.median()).toBe(4);
    });

    it("returns the correct median of array 2", function() {
      expect(array2.median()).toBe(5.5);
    });
  });

  describe("mode", function() {
    it("is defined", function() {
      expect(new Array().mode).toBeDefined();
    });

    it("returns the correct mode of array 1", function() {
      expect(array1.mode()).toEqual({5:2});
    });

    it("returns the correct mode of array 2", function() {
      expect(array2.mode()).toEqual({6:3});
    });
  });
});
// end:spec
