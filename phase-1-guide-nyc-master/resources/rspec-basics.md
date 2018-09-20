### RSpec Terminology and Syntax
_Written by Masha Lifshin_

- `describe`: The `describe` method creates an example group.  We're calling a method defined in the rspec gem.  We pass in the name of the component under test and a block that has the examples.

- `let`: Use let to set up a variable that is shared between tests, to DRY up your specs, and to keep your `it` blocks concise.  With `let`, the variable you set in the block is lazily loaded, which means the block is only executed the first time the variable is used.  With `let!`, the block is executed before each example.  Learn more about `let` from the resources linked below

- `it`: Each example is defined with the `it` method.  `it` takes a string that describes the requirement, which reads like an English sentence, and a block that contains the test case.

- `context`: A powerful construct to keep your spec organized when your code does different things based on different states or conditions

- `expect`: Expectations work together with `matchers` to express an outcome

- `matchers`: Built-in matchers that allow you to test

   - Equivalence 
    ```ruby
    expect(actual).to eq(expected)
    ```

   - Identity 
    ```ruby
    expect(actual).to be(expected)
    ```

   - Comparisons 
    ```ruby
    expect(actual).to be >= expected
    ``` 

   - Types 
    ```ruby
    expect(actual).to be_an_instance_of(expected)
    ```

   - Booleans 
    ```ruby
    expect(actual).to be_truthy
    ```

   - Regular expressions 
    ```ruby
    expect(actual).to match(/expression/)
    ```

   - Errors 
    ```ruby
    expect { ... }.to raise_error
    ```
   - And so much more!

#### Additional Resources
- [RSpec Expectations Documentation](https://github.com/rspec/rspec-expectations)
- [Better Specs](http://betterspecs.org/)
- [RSpec Documentation via Relish](https://relishapp.com/rspec)