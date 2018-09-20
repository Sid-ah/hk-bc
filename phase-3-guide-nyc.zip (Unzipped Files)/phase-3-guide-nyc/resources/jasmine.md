# Jasmine

### Introduction

Jasmine is a testing framework for JavaScript code. It can work for testing standalone JS code, or can work in tandem with server frameworks like Rails or Sinatra to help you test the JS in your larger application.

Jasmine offers a [standalone distribution](https://github.com/jasmine/jasmine/releases) that structures a pure JS application around tests. There are also several Jasmine libraries that integrate with popular frameworks. For example, a [Rails gem](https://github.com/searls/jasmine-rails), a [Ruby gem](https://github.com/jasmine/jasmine-gem), a [Python egg](https://github.com/jasmine/jasmine-py) and an [npm module](https://github.com/jasmine/jasmine-npm).

### Unit Testing with Jasmine

Doing Test-Driven Development with your JavaScript code is not only possible, but pleasant with Jasmine. Jasmine is very similar to RSpec, so much of the syntax will likely feel familiar.

```ruby
# ruby
describe OrangeTree do
  describe "#initialize" do
    it "creates orange trees" do
      expect(OrangeTree.new).to be_a OrangeTree
    end
  end
end
```

vs.

```js
// javascript
describe("orange tree", function() {
  describe("#initialize", function() {
    it("creates orange trees", function() {
      var tree = new OrangeTree()
      expect(tree.constructor).toBe(OrangeTree)
    })})})
```

Take note that each `describe` or `it` is inside its own function, and therefore has its own scope. A variable declared inside one of these functions can be used in all contained functions, but not in any sibling or ancestor functions.

To explore further similarities between RSpec and Jasmine, feel free to look at the matchers available for [RSpec](https://www.relishapp.com/rspec/rspec-expectations/docs/built-in-matchers) and [Jasmine](http://jasmine.github.io/2.3/introduction.html) side-by-side while working, but a few of the main ones are covered below.

##### Example Object

```ruby
# ruby
class OrangeTree
  def age!
    get_older
    grow
    produce_fruit if of_fruit_bearing_age?
    die if of_dying_age?
  end
end
```

```js
// javascript
OrangeTree.prototype.ageOneYear = function() {
  this.getOlder();
  this.grow();
  if(this.age >= this.fruitBearingAge) {
    this.produceFruit();
  }
  if(this.age >= this.dyingAge) {
    this.die();
  }
};
```

##### `beforeEach` vs. `let` or `before`

Use this to stage objects that multiple tests will need within a given context. Due to the scoping of each function, to make any staged objects available in both the `beforeEach` and the `it` functions, the variable will need to be declared in the encapsulating `describe` function.

This is much the same as using instance variables in RSpec `before` blocks.

```ruby
# ruby
describe OrangeTree do
  let(:tree) { OrangeTree.new }
  # or
  before do
    @tree = OrangeTree.new
  end

  it 'ages the tree' do
    tree.age!
    # or
    @tree.age!
    expect(tree.age).to eq 1;
  end
end
```

vs.

```js
// javascript
describe("orange tree", function() {
  var tree;

  beforeEach(function() {
    tree = new OrangeTree();
  });

  it("ages the tree", function() {
    tree.ageOneYear();
    expect(tree.age).toEqual(1);
  });
});
```

##### `spyOn` vs. `stub` and `to_receive`

To introduce predictability into a test suite, or to avoid doing more work than required, the ability to fake function returns is useful. It is also useful to monitor what is happening to a function: how often it has been called, and with what parameters.

```ruby
# ruby
describe OrangeTree do
  describe "age!" do
    it "calls #get_older" do
      tree = OrangeTree.new
      expect(tree).to receive(:get_older)
      tree.age!
    end
  end
end
```

vs.

```js
//javascript
describe("orange tree", function() {
  describe("#ageOneYear", function() {
    it("calls #getOlder", function() {
      var tree = new OrangeTree();
      spyOn(tree, "getOlder");
      tree.ageOneYear();
      expect(tree.getOlder).toHaveBeenCalled();
    });
  });
});
```

To fake responses, `and.returnValue()` can be used. This will prevent the actual defined function from being invoked in the scope of the `spyOn`.

```js
describe("orange tree", function() {
  describe("#ageOneYear", function() {
    it("calls #produceFruit when tree is old enough", function() {
      var tree = new OrangeTree();
      spyOn(tree, "produceFruit");
      spyOn(tree, "ofFruitBearingAge").and.returnValue(true);
      tree.ageOneYear();
      expect(tree.produceFruit).toHaveBeenCalled();
    });
  });
});
```

For other uses, please see the [Spies section of the Jasmine documentation](http://jasmine.github.io/2.3/introduction.html#section-Spies)
