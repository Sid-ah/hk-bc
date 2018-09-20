# Map Restrictions

We may not use Ruby's built in hash type. Building our own map data structure could prove tough, but interesting.  Let's make a few assumptions. Our map should be able to use `Cohort` objects as keys and anything as values.

A `Cohort` class looks like this:

```ruby
class Cohort
  @@id = 0

  attr_reader :name, :id
  
  def initialize(name)
    @name = name
    @id = @@id
    @@id += 1
  end
end
```

And we might use our map class like this:

```ruby
# Create cohorts
nighthawks = Cohort.new("Nighthawks")
otters = Cohort.new("Otters")

# Create our map object
favorite_artists = OurMap.new

# Map cohorts to their favorite artists
favorite_artists.add(nighthawks, "Miley Cyrus")
favorite_artists.add(otters, "Nickelback")


favorite_artists.get(fireflies)
# => "Miley Cyrus"
```


*Hint:*  We might need to figure out a good [hash function](http://en.wikipedia.org/wiki/Hash_table) for our `Cohort` objects in order to use them as keys.
