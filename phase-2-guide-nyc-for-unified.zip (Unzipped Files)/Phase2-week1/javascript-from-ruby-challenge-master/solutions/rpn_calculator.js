/*
// begin:intro
Create an `RPNCalculator` constructor function which can evaluate expressions written in [Reverse Polish notation](http://en.wikipedia.org/wiki/Reverse_Polish_notation).

It should have an `evaluate` function which takes as its input a valid RPN expression and returns its evaluation.  Your calculator only needs to handle addition, multiplication, and subtraction (not division).

Operators and numbers should be separated by a single space.

For example,

```javascript
var calc = new RPNCalculator();

calc.evaluate('1 2 +');   // => 3
calc.evaluate('2 5 *');   // => 10
calc.evaluate('50 20 -'); // => 30

// The general rule is that 'A B op' is the same as 'A op B'
// i.e., 5 4 - is 5 - 4.
calc.evaluate('70 10 4 + 5 * -') # => 0
```
// end:intro

// begin:hint
// end:hint

// begin:initial_code
class RPNCalculator
  # Define your methods, here!
end
// end:initial_code

// begin:wrapper_code
// end:wrapper_code
*/

// begin:solution
class RPNCalculator
  def evaluate(expr)
    tokenize(expr).inject([]) do |stack, token|
      if is_operator? token
        a,b = stack.pop(2)

        stack.push a.method(token).call(b)
      else
        stack.push token.to_i
      end
    end.pop
  end

  private
  def tokenize(string)
    string.split(' ')
  end

  def is_operator?(token)
    ['+', '-', '*'].include? token
  end
end
// end:solution

// begin:spec
describe RPNCalculator do
  let(:rpn) { RPNCalculator.new }

  describe '#evaluate' do
    it "expects 1 argument" do
      RPNCalculator.instance_method(:evaluate).arity.should eq 1
    end

    it "correctly evaluates '0'" do
      rpn.evaluate('0').should be_zero
    end

    it "correctly evaluates '-1'" do
      rpn.evaluate('-1').should eq -1
    end

    it "supports addition" do
      rpn.evaluate('1 1 +').should eq (1 + 1)
    end

    it "supports multiplication" do
      rpn.evaluate('2 2 *').should eq (2 * 2)
    end

    it "subtracts in the correct order" do
      rpn.evaluate('5 10 -').should eq (5 - 10)
    end

    it "correctly combines multiplication, addition, and subtraction" do
      rpn.evaluate('20 10 5 4 + * -').should eq (20 - 10*(5 + 4))
    end

    it "handles arbitrary input" do
      a, b, c = Array.new(3) { rand(100) }

      rpn.evaluate("#{a} #{b} - #{c} *").should eq (a-b)*c
    end
  end
end
// end:spec
