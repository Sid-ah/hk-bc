/*
// begin:intro
Implement `Array.pad()`: it accepts a minimum size (non-negative integer) and an optional pad value as arguments.

If the array's length is less than the minimum size, `Array.pad()` should return a new array padded with the pad value up to the minimum size.

For example,
```javascript
[1,2,3].pad(5);
```

should return

```javascript
[1,2,3,null,null]
```

And
```javascript
[1,2,3].pad(5, 'apple');
```

should return

```javascript
[1,2,3,'apple','apple']
```

If the minimum size is less than or equal to the length of the array, it should just return the array.

That is, `[1,2,3].pad(3)` should return `[1,2,3]`.

`myArray.pad(0)` should always return an array equal to `myArray`.  `Array.pad()` should always return a new object, i.e., it should be non-destructive.
// end

// begin:hint
// end:hint

// begin:initial_code
Array.prototype.pad = function(minSize, val) {
  // Your code here!
};
// end:initial_code
*/

// begin:solution
Array.prototype.pad = function(minSize, val) {
  var filler = (val !== undefined) ? val : null;  
  var newArray  = this.slice(0);
  var padNum    = minSize - newArray.length;
  
  if (padNum > 0) {
    for (var i=0; i < padNum; i++) {
      newArray.push(filler);
    }
  }
  
  return newArray;
};
// end:solution

// begin:spec
describe("Array", function() {
  var emptyArray  = [];
  var array       = [1,2,3];
  var longArray   = [1,2,3,1,2,3,1,2,3,1,2,3,1,2,3,1,2,3,1,2,3,1,2,3,1,2,3,1,2,3];  
  var allArrays   = [emptyArray, array, longArray];
  
  describe("pad", function() {
    it("doesn't pad a long array", function() {
      var newArray = longArray.pad(10);
      expect(newArray.length).toEqual(longArray.length);
    });
    
    it("pads elements to the end of the array", function() {
      for (var i=0; i < allArrays.length; i++) {
        var padSize   = 1 + Math.floor(Math.random() * 50);
        var padArray  = [];
        for (var n=0; n<padSize; n++) { padArray.push('apple'); }
        
        var expectedResult = allArrays[i].concat(padArray);
        
        expect(allArrays[i].pad(allArrays[i].length + padSize, 'apple')).toEqual(expectedResult);
      }
    });
    
    it("doesn't pad when minimum size is equal to the array's length", function() {
      for (var i=0; i < allArrays.length; i++) {
        expect(allArrays[i].pad(allArrays[i].length)).toEqual(allArrays[i]);
      }
    });
    
    it("doesn't pad when the minimum size is 0", function() {
      for (var i=0; i < allArrays.length; i++) {
        expect(allArrays[i].pad(0)).toEqual(allArrays[i]);
      }
    });
    
    it("pads with null by default", function() {
      expect(emptyArray.pad(2)).toEqual([null,null]);
    });
    
    it("can pad with a string", function() {
      expect(emptyArray.pad(2,'apple')).toEqual['apple','apple'];
    });
    
    it("can pad with an object", function() {
      expect(emptyArray.pad(2, {})).toEqual([{}, {}]);
    });
  });
});
// end:spec