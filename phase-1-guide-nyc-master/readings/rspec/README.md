# RSpec Basics

## How to run your tests

Most challenges will have 2 main ruby files, a .rspec file and a Gemfile in the source folder.

For example the **Pig Latin** Challenge has the following files in source:
```ruby
.rspec
Gemfile
pig_latin.rb
pig_latin_spec.rb
```

To run our tests we will run the following command.  It allows rspec to pick up one file to run.

```ruby
> rspec pig_latin_spec.rb
```

## What does the output mean?

When you run your tests, you will get feedback as to what happened.

If your spec file has this:

```ruby
describe 'Converting to Pig Latin' do
  it "does stuff" do
    expect(2+2).to eq(4)
  end

  it "fails" do
    expect(true).to be_false
  end
end
```
You will see this when you run it.

```ruby
Converting to Pig Latin
  does stuff
  fails (FAILED - 1)

Failures:

  1) Converting to Pig Latin fails
     Failure/Error: expect(true).to be_false
       expected: false value
            got: true
     # ./source/pig_latin_spec.rb:10:in `block (2 levels) in <top (required)>'

Finished in 0.0115 seconds
2 examples, 1 failure

Failed examples:

rspec ./source/pig_latin_spec.rb:9 # Converting to Pig Latin fails
```

The tests that have failed will be noted with a `FAILED` next to their name and you will be given a message to tell you what happened for each failing test.

It is your job to **READ THE ERROR** and decide what code change to make next to make the program work and satisfy the expectation of the test.

## Anatomy of a test

The ***describe*** block
```ruby
describe "Roman Numerals" do
# I describe what is being tested to give my tests context.
end
```

The ***it*** block
```ruby
it "converts 1 to I" do
# each example begins with an 'it' and
# specifies the expected behavior of your code
end
```

***Expectations***
```ruby
expect(to_roman(1)).to eq("I")
# This serves to tell someone reading and executing your tests
# what your program should or shouldn't to.
```

***Matchers***
You will use matchers in your expectations to test assumptions.  These are methods that are available in rspec that help our tests read much more like english.  There are cheat sheets below which go into many kinds of matchers.
```ruby
expect(false).to be_false
expect(true).to be_true
expect(true).not_to be_false
expect(false).not_to be_true
expect(5).to eq(5)
expect(5).not_to eq(6)
```

***Put it all together!***

Together these come together to make up the specifications for your code!  You now have a nice english sounding expectation of your program that will give you feedback immediately after you run your code.
```ruby
describe 'Roman Numerals' do
  it "converts 1 to I" do
    expect(to_roman(1)).to eq("I")
  end
end
```

## Additional Resources

- [Rspec Basics](../../resources/rspec-basics.md)
- [Rspec Basics from Thoughtbot](https://thoughtbot.com/upcase/test-driven-rails-resources/rspec.pdf)
- [Rspec Matchers from Thoughtbot](https://thoughtbot.com/upcase/test-driven-rails-resources/matchers.pdf)
- [Thorough matchers cheatsheet](https://www.anchor.com.au/wp-content/uploads/rspec_cheatsheet_attributed.pdf)
