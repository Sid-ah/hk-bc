/*
// begin:intro
Write a function `longestString` which takes as its input an `Array` of `Strings` and returns the longest `String` in the `Array`.

For example:

```javascript
// 'zzzzzzz' is 7 characters long
longestString(['cat', 'zzzzzzz', 'apples']);  // => "zzzzzzz"
```

If the input `Array` is empty `longestString` should return `null`.
// end:intro

// begin:hint
// end:hint

// begin:initial_code
var longestString = function(array) {
  // Your code here!
};
// end:initial_code

// begin:wrapper_code
// end:wrapper_code
*/

// begin:solution
var longestString = function(array) {
  var longest = null;
  
  for (var i=0; i < array.length; i++) {
    if ((longest === null) || (array[i].length >= longest.toString().length)) {
      longest = array[i];
    }
  }
  
  return longest;
};
// end:solution

// begin:spec
describe("longestString", function() {
  it("returns null when the array is empty ([])", function() {
    expect(longestString([])).toEqual(null);
  });
  
  it("returns '' when that is the only element in the array", function() {
    expect(longestString([''])).toEqual('');
  });
  
  it("returns 'cat' when that is the only element in the array", function() {
    expect(longestString(['cat'])).toEqual('cat');
  });
  
  it("returns the 'zzzzzzz' with the example array", function() {
    expect(longestString(['cat', 'zzzzzzz', 'apples'])).toEqual('zzzzzzz');
  });
  
  it("returns the longest string in an array of strings", function() {
    var array = [];
    
    for (var i=0; i < 10; i++) {
      var string = 'a';
      for (var n=0; n < i; n++) {
        string += 'a'
      }
      array.push(string);
    }
    
    expect(longestString(array)).toEqual('aaaaaaaaaa');
  });
});
// end:spec