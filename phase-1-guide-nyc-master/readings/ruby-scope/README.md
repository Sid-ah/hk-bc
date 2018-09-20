# Ruby Scope

## Introduction
Scope describes where a variable is accessible. For example, given the following
function:

```ruby
def nickname_generator(name)
  adjective = ["dizzy", "jazzy", "little", "big", "fresh", "junior", "cheezy"].sample
  "#{adjective} #{name}"
end
```

The function `nickname_generator` assigns a local variable `adjective`, which is
only accessible inside the `nickname_generator` function.

```text
irb> nickname_generator("mike")
=> "cheezy mike"
irb> adjective
NameError: undefined local variable or method `adjective' for main:Object
  from (irb):30
  from /opt/boxen/rbenv/versions/2.1.1/bin/irb:11:in `<main>'
```

## Types of Scope
In Ruby, the scope of any variable is determined by its name.

| Scope     | variable name begins with |
|-----------|---------------------------|
| global    | $                         |
| constant  | [A-Z]                     |
| class     | @@                        |
| instance  | @                         |
| local     | [a-z] or _                |

For example, just by changing the name of our variable `adjective` in the
previous example, we can access it outside the function. Here we'll switch it to
the global scope:

```ruby
def nickname_generator(name)
  $adjective = ["dizzy", "jazzy", "little", "big", "fresh", "junior", "cheezy"].sample
  "#{$adjective} #{name}"
end
```

```text
irb> nickname_generator("jill")
=> "fresh mike"
irb> $adjective
=> "fresh"
```

## Why Scope?
You might ask, why even have scope? Why not make all variables available
everywhere? It'd be much easier than having to keep track of these different
scope rules, right?

For one, scope narrows our working space. Imagine you're working on a program
to register students. It has with thousands of functions. Without fail, some
common variable names are going to be repeated. For example `index`, `name`,
`element`, `students`, `schedule`, etc.

Without variable scoping you'd probably pull your hair out trying to
figure out who last changed the value of some commonly used variable name like
`students`. **Scope insulates one part of code from another.**

## Types of Variable Scope in Ruby

### Globals
Globals, like the name suggests are visible everywhere. Quite convenient, but
consider globals a sharp knife that you should use with care. Aim to never
create new global variables if possible. Sometimes they're necessary, but treat
global scope as a last resort.

Global variables in Ruby can be defined anywhere and are prefixed with a `$`
character. Ruby provides a number of useful global variables. For example `$0`
holds the name of the Ruby file you're running:

```ruby
puts "This filename is: #{$0}"
```

```text
$ ruby example.rb
This filename is: example.rb
```

There are a number of other globals available in all your Ruby programs, most of
them with cryptic names like: `$!`, `$@`, `$_`. Quite often there are more
readable ways to access the same data. For example the file's name is also
available as a variable named `__FILE__` (which incidently is a local variable
that has been defined in the top-level `main` scope).

## Constants

Constants are variables that begin with a capital letter. Classes and modules
are examples of constants:

```ruby
class Person
end

module Enumerable
end
```

Tradtionally in Ruby we'll capitalize only the first letter of things like
classes and modules, but capitalize the entire variable name for constants that
aren't classes or modules.

In some languages, constants are a type of variable that once set to a value
cannot be changed. In Ruby, it's possible to change a constant's value:

```ruby
DEFAULT_NAME="Jane Doe"

DEFAULT_NAME="John Doe"
```

But Ruby does *warn* you when you change a constant's value:

```text
example.rb:3: warning: already initialized constant DEFAULT_NAME
example.rb:1: warning: previous definition of DEFAULT_NAME was here
```

Heed these warnings and either reconsider whether the variable in question
should be a constant. You might decide to modify your program so that you don't
redefine the constant's value.

Configuration values, defaults or lookup keys are often good fits for constants.
Here are some examples:

```ruby
class Car
  DEFAULT_CYLINDER_COUNT = 4
  HORSEPOWER_PER_CYLINDER = 30

  def initialize(cylinder_count=DEFAULT_CYLINDER_COUNT)
    @cylinder_count = cylinder_count
  end

  def horsepower
    @cylinder_count * HORSEPOWER_PER_CYLINDER
  end
end
```

The visibility of constants is limited to the class or module in which the
constant is defined. If a constant is not defined inside a class or module, it's
treated as a global.

```ruby
APP_NAME = "Person Tracker"

class Person
  DEFAULT_NAME = "Pat"
end
```

```text
irb> puts DEFAULT_NAME
NameError: uninitialized constant DEFAULT_NAME
irb> puts APP_NAME
Person Tracker
```

Constants are available from outside a class or module if you include the class
or module name:

```text
irb> puts Person::DEFAULT_NAME
Pat
```

## Class

Class variables visible only from inside the class. They are prefixed with `@@`:

```ruby
class Person
  @@person_count = 0

  def initialize(name)
    @name = name
    @@person_count += 1
  end

  def self.count
    "There are #{@@person_count} people."
  end
end
```

In the above example the **class** `Person` has a variable `@@person_count` that is
incremented by one each time the class' `initialize` method is called:

```text
irb> Person.new("Bob")
irb> puts Person.stats
There are 1 people.

irb> Person.new("Jill")
irb> Person.new("Meghan")
irb> puts Person.count
There are 3 people.
```

Class variables, like instance variables aren't available to outsiders. For
example you can't access the Person class' variable `@@person_count` from
outside the class:

```text
irb> Person.person_count
NoMethodError: undefined method `person_count' for Person:Class
```

You could expose the variable with a getter method similar to our `Person.stats`
method:

```ruby
class Person
  @@person_count = 0 # class variable, there's only one variable and value for
                     # @@person_count

  def initialize(name)
    @name = name # instance variable, different for each Person instance
    @@person_count += 1
  end

  def self.person_count
    @@person_count
  end
end
```

```text
irb> Person.person_count
=> 0
```

## Instance Variables

Instance variables are scoped to a particular instance of an object. Much like
class variables, without a getter or setter method instance variable aren't accessible
outside the instance.

Typically you'll use a class to define (and store) common *behavior* (methods that all
instances will have available) and instance variables to store unique *state*.

```ruby
class Person
  # class constant
  NICKNAME_ADJECTIVES = ["dizzy", "jazzy", "little", "big", "fresh", "junior", "cheezy"]

  def initialize(name, age, favorite_color)
    # below: three pieces of state, stored per instance of the Person class.
    # saved as instance variables
    @name = name.capitalize
    @age = age
    @favorite_color = favorite_color
  end

  # below: two behaviors (methods), shared across all instances
  def nickname
    NICKNAME_ADJECTIVES.sample.upcase + " " + @name
  end

  def birth_year
    Time.now.year - @age
  end
end
```

```text
irb> p = Person.new("nate", 32, "red")
=> #<Person:0x007fb36c355940 @name="Nate", @age=32, @favorite_color="red">
irb> p.nickname
=> "FRESH Nate"
irb> p.birth_year
=> 1982
irb> p.name
=> NoMethodError: undefined method `name' for #<Person:0x007fb36c355940>
```

Note at the end of the above irb session we aren't able to access instance
variables from outside the instance. Instance variables are scoped only to the
instance. Use a getter to expose an instance variable to the outside:

```ruby
class Person

  def initialize(name, age, favorite_color)
    @name = name.capitalize
    @age = age
    @favorite_color = favorite_color
  end

  def name
    @name
  end

  def age
    @age
  end

  def favorite_color
    @favorite_color
  end
end
```

Now, with getter instance methods available for all our instance variables, we
can access a `Person` instance's properties from outside the instance:

```text
irb> p = Person.new("Mike", 17, "orange")
=> #<Person:0x007fb36c2b7358 @name="Mike", @age=17, @favorite_color="orange">
irb> p.name
=> "Mike"
irb> p.age
=> 17
irb> p.favorite_color
=> "orange"
```

Typing all these getter methods is pretty tedious though, so Ruby has some
class methods to create getters and setters for you:

```ruby
class Person
  attr_reader :name, :age, :favorite_color # creates getters for all instance
                                           # variables

  def initialize(name, age, favorite_color)
    @name = name.capitalize
    @age = age
    @favorite_color = favorite_color
  end
end
```

```text
irb> p = Person.new("Mike", 17, "orange")
=> #<Person:0x007fb36c2b7358 @name="Mike", @age=17, @favorite_color="orange">
irb> p.name
=> "Mike"
irb> p.age
=> 17
irb> p.favorite_color
=> "orange"
```

There are a few helper methods available:

| class method    | creates                  |
|-----------------|--------------------------|
| attr_reader     | getter                   |
| attr_writer     | setter                   |
| attr_accessor   | getter & setter          |

It's tempting to think these helper methods perform magic, but the work they do
is actually quite simple:

`attr_reader :name, age` creates simple getter methods:

```ruby
def name
  @name
end

def age
  @age
end
```

`attr_writer :name, :age` creates simple setter methods:

```ruby
def name=(name)
  @name = name
end

def age=(age)
  @age = age
end
```

Note the distinctive name of the setter methods, they include an `=` as part of
the variable name. Ruby looks for methods with this naming convention when you
set an instance variable:

```ruby
p = Person.new
p.age = 18 # calls the setter method age=(age) with 18 as the only argument
```

In fact you could adjust your syntax to look a bit more like a traditional
method call:

```ruby
p = Person.new
p.age=(18)
```

Of course the former style of calling a setter is preferred.


### Custom getters & setters

Sometimes you'll want to do more than just set or return an instance variable
from a getter or setter method. Feel free to write your own methods instead of
having Ruby generate them via the `attr_` helper methods.

```ruby
class Person
  def initialize(name, age)
    @name = name.strip
    @age = age
  end

  def name
    # always return an uppercase version of the person's name
    @name.upcase
  end

  def name=(name)
    # remove any leading & trailing whitespace
    @name = name.strip
  end
end
```

```text
irb> p = Person.new("Torey", 23)
irb> puts p.name
TOREY
irb> p.name = "    mr. pink    "
irb> puts p.name
MR. PINK
```

## Local

Local variables are visible only during the scope in which they were created.
Local variables begin with a lower case letter or an underscore:

```ruby
# local variables
age = 17
_age = 17
```

In order to understand local variable scope it's important to understand when
new local scopes are created. Here are some examples of when a new scope is
created:

**Methods** define their own local scope. A local variable defined in  one method is
invisible to another:

```ruby
def random_roll
  # roll is a local variable
  roll = 1 + rand(5)
end

def jackpot?
  random_roll

  # since roll is a local variable defined in random_roll
  # we won't be able to access it here
  if roll == 6
    puts "You won the jackpot!"
  else
    puts "Unlucky! Try again."
  end
end
```

Method scope is one of the easiest to understand. In the above example, since
`roll` is a local variable defined inside the method `random_roll`, we won't be
able to access it in the other method `jackpot?`.

**Blocks** also generate new method scope in Ruby:

```ruby
[1,2,3].each do |item|
  item = item * item
end

puts item # NameError: undefined local variable or method `item' for main:Object
```

You'll use local variables more than any other type in Ruby. They're perfect for
data that you won't need to retain access to for any considerable time. Also,
local variables prevent data from leaking across your codebase, since they're
only available for the scope in which they were defined.
