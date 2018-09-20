# OOJS: A Garden with Flowers

## Summary
We're going to build some JavaScript objects:  a garden object with a collection of flowers.  This challenge will be similar to some of the earlier Ruby challenges that we've completed.  Remember the [orange tree challenge][] where we designed an orange tree that had many oranges?  This challenge will be very similar.


### JavaScript Objects
We're going to build objects using two approaches:  through object literal syntax and through a constructor function.  These are two approaches that ultimately do the same thing:  create objects with attributes and behaviors.

***Object literal syntax***.  When we only need one instance of an object, it's convenient to use [object literal syntax] to create that object.  We "literally" write the object that we want, declaring the object's properties and their values.  The syntax might feel similar to writing a Ruby hash object, but there's no real equivalent for creating objects this way in Ruby.  In Figure 1 we create a person with first and last names and the behavior to combine them into a full name.

```js
var person = {
  firstName: "Kweku",
  lastName: "White",
  fullName: function() {
    return this.firstName + " " + this.lastName;
  }
}

person.firstName;
// => "Kweku"
person.fullName();
// => "Kweku White"
```
*Figure 1*. Using object literal syntax to represent a person as a JavaScript object.


***Constructor functions***.  If we find ourselves needing to create multiple objects with the same behaviors and properties, we can write a constructor function. Constructor functions serve as *factories* that produce objects following a template.  This is similar to how we create objects in Ruby (i.e., defining a class with an initialize method that sets up objects).  Using a constructor function also allows us to share properties and behaviors among objects through the constructor's prototype—like instance methods declared in a Ruby class that are shared among instances of that class.  

In Figure 2, we use a constructor function to create two person objects with the same attributes and behaviors as the lone person object created in Figure 1.  The `Person()` constructor function sets the attributes that are unique to each instance:  the first and last names.  The full name behavior is shared by the person objects through the `Person.prototype` object.

```js
var Person = function(firstName, lastName) {
  this.firstName = firstName;
  this.lastName = lastName;
}

Person.prototype.fullName = function() {
  return this.firstName + " " + this.lastName
}

var grayson = new Person("Grayson", "Arthur");
grayson.firstName;
// => "Grayson"

var warner  = new Person("Warner", "Constable");
warner.fullName();
// => "Warner Constable"
```
*Figure 2*. Using a constructor function to represent people as JavaScript objects.


### Jasmine Tests
Similar to our use of RSpec for testing the behaviors of our Ruby objects, we're going to use [Jasmine][] for testing the behaviors of our JavaScript objects.  Fortunately, Jasmine reads a lot like RSpec; a lot of the functions we'll call have the same names: `describe()`, `it()`, `expect()`, etc.

But there are definitely differences as well.  For example, Jasmine provides a different set of matchers. Many Jasmine matchers are similar to RSpec matchers (e.g., `toEqual()`), but some matchers that we're used to using in RSpec are not available in Jasmine.  `let` is gone, too.  If we have shared setup for tests, we need to use `beforeEach()` and/or `beforeAll()`.  And, of course, the code is JavaScript.  We need to remain aware of JavaScript's scoping rules.  And Ruby blocks are replaced with anonymous functions.  When describing an object in RSpec, the actual tests are declared inside a block passed to the `describe` method.  In our Jasmine tests, anonymous functions fulfill the role of these blocks.  When we call the `describe()` function, we pass along an anonymous function containing the actual tests.  Figures 3 and 4 show the same test written in RSpec and Jasmine.

```ruby
describe "a string with my name" do
  let(:my_name) { "Carson Hollands" }
  
  it "is my name" do
  	expect(my_name).to eq "Carson Hollands"
  end
end
```
*Figure 3.* Testing the value of a Ruby string object with RSpec.

```js
describe("a string with my name", function() {
  var myName;
  
  beforeEach(function() {
    myName = "Carson Hollands";  
  });
  
  it("is my name", function() {
    expect(myName).toEqual("Carson Hollands");
  });
});
```
*Figure 4.* Testing the value of a JavaScript string object with Jasmine.


## Releases
### Pre-release:  Review and Run the Tests
We have a test suite that will guide us as we develop our garden and flower objects; the test files are located in the `spec/` folder.  To run the tests, we open the `SpecRunner.html` file in the browser.  Open the spec runner.  The garden tests are all failing and the flower tests are pending.  As we write the code to create our objects, we'll rerun the tests by refreshing the spec runner.


### Release 0: The Flowers
Our flower objects are simple.  Each flower has two attributes:  name and color.  We're going to instantiate flowers using a `Flower()` constructor function, which has been defined in the file `src/flower.js`.

The tests for flowers have not been written.  Write tests that demonstrate that our constructor function produces objects with the correct names and colors.  Then, update the `Flower()` constructor function to pass the tests.

*Note:*  Follow the example in Figure 4 to write the Jasmine tests.


### Release 1: The Garden
Begin by creating the garden object.  In the file `src/garden.js` we have a variable `garden` whose value is an object literal with no properties.  Use the tests to guide adding the desired properties to the garden.  Some of the properties will be attributes like name and location.  Other properties will be behaviors like planting flowers.


## Conclusion
We can take an [object-oriented approach][] to writing JavaScript: creating objects with attributes and behaviors, sharing behaviors among objects. etc.  We just need to learn how to implement these in JavaScript.


[jasmine]: http://jasmine.github.io/2.4/introduction.html
[object literal syntax]: http://www.dyn-web.com/tutorials/object-literal/
[object-oriented approach]: https://developer.mozilla.org/en-US/docs/Web/JavaScript/Introduction_to_Object-Oriented_JavaScript
[orange tree challenge]: ../../../orange-tree-1-just-oranges-challenge

