/*
// begin:intro
Write a method `print_triangle` which takes at its input an integer representing the number of rows to print, and prints out a right triangle consisting of `*` characters, one line per row.

For example, `print_triangle(5)` should print out:
```text
*
**
***
****
*****
```

And `print_triangle(2)` should print out:

```text
*
**
```

If we pass in `0` it should print nothing (not even an empty line).
// end:intro

// begin:hint
// end:hint

// begin:initial_code
// print_triangle(rows) prints out a right triangle of +rows+ rows consisting 
// of * characters
// 
// +rows+ is an integer
// 
// For example, print_triangle(4) should print out the following: 
// *
// **
// ***
// ****

def print_triangle(rows)
  # Your code goes here!
end
// end:initial_code

// begin:wrapper_code
// end:wrapper_code
*/

// begin:solution
def print_triangle(rows)
  1.upto(rows) do |i|
    puts '*'*i
  end
end
// end:solution

// begin:spec
describe 'print_triangle' do
  before(:each) do
    @output = StringIO.new
    @old_stdout = $stdout
    $stdout = @output
  end

  it "prints nothing if given 0" do
    print_triangle(0)
    @output.rewind
    @output.read.should be_empty
  end

  it "prints '*' if given 1" do
    print_triangle(1)
    @output.rewind
    @output.read.should eq "*\n"
  end

  it "prints a 5-row triangle" do
    print_triangle(5)
    @output.rewind
    @output.read.should eq "*\n**\n***\n****\n*****\n"
  end

  it "has the correct last line for a 100-row triangle" do
    print_triangle(100)
    @output.rewind
    @output.read.split("\n").last.should eq '*'*100
  end

  after(:each) do
    $stdout = @old_stdout
  end
end
// end:spec