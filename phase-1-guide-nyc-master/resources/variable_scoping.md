# Scoping Demystified

### Topics
- Variable Scoping (where are variables available for me to use?)
	- In control structures
	- Within a method
	- Outside a method
- Global Variables
- Constants

### What do we mean by scope?

Scope is the context in which the variable or method is valid.  Where it can be accessed.

Scopes in Ruby
- Local Scope
- Global Scope
- Instance
- Class

For the purposes of this lesson, we will be talking primarily about Local and Global scope.  Instance and Class will come in week 2.

### Local Scope

Local Scope means something is accessible only to the specific context in which it was defined.  Like a method, a file, a loop, or a conditional statement.

##### Scoping in control structures (conditionals, loops)

This method has 2 variables, `special_string` (defined outside of the conditional), and `result` (defined inside the conditional).

- When returning the last line of this method, what do we expect?
- Why?
- How can we change this code to make it have the result in the return string?

```ruby
def variables_in_conditionals(number)

	special_string = "Awesome!"

	if number > 5
		result = "You win!"
	end

	"#{result}, #{special_string}"
end
```

This method has a variable `list` that is defined within the `upto` loop.

- What happens when I try to call this method?
- Why?
- What can be done to fix this issue?

```ruby
def variables_with_loops(first = 0)
  1.upto(8) do |number|
    list << number
  end
  list
end

p "Variables with loops 1: #{variables_with_loops}"

```

##### Scoping in Methods

In the code below I'm trying to use a variable `a` outside of the method.  I'm assigning an array as the value of this variable.

- What do we expect to happen when I try to run this code?
- Why?

```ruby
def testing_scope_local_variable(num)
  a = []
  a << num
end

a = [1, 2]
p "Scope local variable: #{testing_scope_local_variable(2)}"
```

### Global Scope

Global variables are those that have the `$` in front of the name.  These are accessible anywhere within your program across all scopes.

##### Example
In the code below we assign the variable `$a` to the value `[1, 2]`.  Because it is in global scope, when we go to access it in the method we do not have an issues pushing the value 2 onto it.

```ruby
def testing_scope_global_variable(num)
  $a << num
end

$a = [1, 2]
p "Scope global variable: #{testing_scope_global_variable(2)}"
```

### Constants

When constants are defined we use all caps with words separated by underscores.

Constants declared within a class or module are available anywhere within the context of that class or module. Constants declared outside of a class or module are assigned global scope.

##### Example

```ruby
MAX_AGE = 22
def working_with_constants
  puts "the max age for a student is: #{MAX_AGE}"
end

working_with_constants
```
Here is another example of referencing the MAX_AGE that lives in the global scope.  `::` is the *scope resolution operator*
```ruby
MAX_AGE = 22
def working_with_constants
  puts "the max age for a student is: #{::MAX_AGE}"
end

working_with_constants
```

Here is yet another example of scoping a constant.  Here we have defined the constant `MAX_AGE` inside the module `Stuff`.  In order to reference it in the scope of the module we use `Stuff::MAX_AGE`.  This tells is to look it up in the Stuff namespace.

```ruby
def working_with_constants
  puts "the max age for a student is: #{Stuff::MAX_AGE}"
end

module Stuff
	MAX_AGE = 22
end

working_with_constants
```
##### Stretch question

What happens if I try to change the value of a constant that is defined in global scope?

```ruby
MAX_AGE = 22

def working_with_constants
  puts "the max age for a student is: #{MAX_AGE}"
end

MAX_AGE = 44

working_with_constants
```
