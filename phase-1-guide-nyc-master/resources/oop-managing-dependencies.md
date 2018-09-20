# Managing Dependencies

An object has a dependency when it knows:
- The name of another class
- The name of a message that it intends to send to someone other than self
- The arguments that a message requires
- The order of those arguments

With OOP, your goal is to manage dependencies so that each class has the fewest possible -- a class should know just enough to do its job and not one thing more.

Here are some techniques for reducing dependencies in your code:

### Injecting Dependencies

"Dependency Injection" is a 25-dollar term for a 5-cent concept. Dependency Injection is the design of objects where they receive instances of the objects from other pieces of code instead of constructing them internally.

So, instead of:
```ruby
class Car
  def initialize
    @driver = Person.new
  end
end
```

We "inject" the dependency in the constructor:
```ruby
class Car
  def initialize(person)
    @driver = person
  end
end
```

This means that any object implementing the interface which is required by the object can be substituted in without changing the code, which simplifies testing, and improves decoupling. It's a very useful technique for testing, since it allows us to isolate classes and mock or stub out dependencies easily.

### Isolating Dependencies

When a class contains embedded references to a message that is likely to change, isolating the reference provides some insurance against being affected by that change.

Starting with:
```ruby
def Car
  def driver_comfort
    foo = some_intermediate_result * driver.age
  end
end
```

We isolate the external message by wrapping it in another method:
```ruby
def Car
  def driver_comfort
    foo = some_intermediate_result * driver_age
  end

  def driver_age
    driver.age
  end
end
```

Now if the interface of driver changes, we will only have to alter our Car class in one place. Although not every external method is a candidate for this preemptive isolation, it’s worth examining your code, looking for and wrapping the most vulnerable dependencies.

An alternative way to eliminate these side effects is to avoid the problem from the very beginning by reversing the direction of the dependency.

### Remove argument-order dependencies

We have three arguments that need to be passed in order.
```ruby
def initialize(color, manufacturer, driver)
  @color        = color
  @manufacturer = manufacturer
  @driver       = driver
end
```

Instead, we use hashes for initialization arguments. The order of arguments is no longer fixed.
```ruby
def initialize(args)
  @color        = args[:color]
  @manufacturer = args[:manufacturer]
  @driver       = args[:driver]
end
```

Even better, explicitly define defaults:
```ruby
def initialize(args)
  @color        = args.fetch(:color, "white")
  @manufacturer = args.fetch(:manufacturer, "Toyota")
  @driver       = args[:driver]  
end
```

### Dependency Inversion
Be conscious about the direction of your dependencies -- build classes that depend on things that change less often than they do.

The Dependency Inversion Principle is primarily about reversing the conventional direction of dependencies from "higher level" components to "lower level" components such that "lower level" components are dependent upon the interfaces owned by the "higher level" components. (Note: "higher level" component here refers to the component requiring external dependencies/services, not necessarily its conceptual position within a layered architecture.) In doing so, coupling isn't reduced so much as it is shifted from components that are theoretically less valuable for reuse to components which are theoretically more valuable for reuse.
