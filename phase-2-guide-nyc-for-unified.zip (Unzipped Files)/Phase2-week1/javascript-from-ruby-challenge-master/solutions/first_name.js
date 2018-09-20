/*
// begin:intro
// end:intro

// begin:hint
// end:hint

// begin:initial_code
// end:initial_code

// begin:wrapper_code
// end:wrapper_code
*/

// begin:solution
var firstName = 'Steven';
// end:solution

// begin:spec
describe("firstName", function() {
  it("defines a local variable firstName", function() {
    expect(firstName).not.toBeUndefined();
  });
  
  it("assigns the value 'Steve' to the variable firstName", function() {
    expect(firstName).toBe('Steve');
  });
});
// end:spec
