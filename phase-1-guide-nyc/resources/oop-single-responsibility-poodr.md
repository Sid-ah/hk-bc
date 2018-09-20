# Single Responsibility

When we describe a class as *cohesive*, or having *single responsbility*, we mean that everything the class does is highly related to its purpose.

One practical method of determining if a class is cohesive is to pretend that it’s a person and to interrogate it. If you rephrase every one of its methods as a question, asking the question ought to make sense. For example, “Please Mr. Car, what is your color?” seems reasonable, while “Please Mr. Car, what are your wheel sizes?” is on shaky ground, and “Please Mr. Car, what are your wheel rim shapes, brand, and colors?” is asking too much (you should be asking each of the wheels those questions).

Single responsibility helps us organize code in a way that makes things easier to manage and change later. While on the subject, let's talk about a couple ways to write code that embraces change:

### Depend on Behavior, Not Data

Your class interface (the methods you define) should be based on the behavior of objects, not the underlying data. For example, it is generally smart to wrap and reference instance variables in reader methods so that the underlying implementation can be changed. Case in point:
```ruby
class RainForest
  def temperature
    @temperature * unanticipated_adjustment_factor
  end
end
```

### Hide Data Structures

Similar to how we abstracted temperature in the previous method, it is helpful to abstract complex data structures so that our code is not tied down to the data structure. Take a look at this example:

```ruby
class JunkYard
  attr_reader :data
  
  def initialize(data)
    @data = data
  end

  def wheel_diameters
    # 0 is rim, 1 is tire 
    data.collect {|cell| cell[0] + (cell[1] * 2)}
  end
end
```

Imagine if we had ten other methods reliant on this nested array data structures? Things could get messy. We can solve this by isolating and abstracting away the messy structural information and DRYing out our code, which makes this class far more tolerant of change.

```ruby
class JunkYard
  attr_reader :wheels

  def initialize(data)
    @wheels = wheelify(data)
  end

  def diameters
    wheels.collect {|wheel| wheel.rim + (wheel.tire * 2)}
  end

  Wheel = Struct.new(:rim, :tire)
  def wheelify(data)
    data.collect {|cell| Wheel.new(cell[0], cell[1])}
  end
end
```