# Inheritance examples

This example is meant to show that using class variables in this way would actually result in issues with cook time across all cookies.  Be very careful about using and modifying class variables defined in super classes.

```ruby
class Cookie

    attr_reader :cook_time

    @@cook_time = 10

end

class ChocolateChip < Cookie

    def initialize
        @@cook_time = 12
    end
end

cookie = Cookie.new
cc_cookie = ChocolateChip.new

puts cc_cookie.cook_time
puts cookie.cook_time
```
##  A dry example with inheritance.

Notice how the common attributes are defined in the super class **Cookie** and we instantiate the specific kinds of cookies with the things unique to that cookie type (ingredients).

Notice also when executing this example, when invoking the to_s each cookie has the respective cookie type that was passed to super by it's initialize method.  

```ruby
class Cookie

    attr_reader :cook_time, :status, :ingredients

    COOK_TIME = 10

    def initialize(cook_time = COOK_TIME, ingredients = {})
        @cook_time = cook_time
        @status = :doughy
        @ingredients = ingredients
    end

    def to_s
        "cook time: #{cook_time}, status: #{status}, ingredients: #{ingredients.inspect}"
    end
end

class ChocolateChip < Cookie

    COOK_TIME = 12

    def initialize(ingredients)
        super(COOK_TIME, ingredients)
    end

end

class PeanutButter < Cookie

    COOK_TIME = 14

    def initialize(ingredients)
        super(COOK_TIME, ingredients)
    end

end

class Batch

    attr_reader :cookies

    def initialize(*cookies)
        @cookies = cookies
    end
end

class Oven

    attr_reader :batches

    def initialize
        @batches = []
    end

    def add_batch(batch)
        batches << batch
    end
end
cookie = Cookie.new
cc_cookie = ChocolateChip.new({:flour => "1 cup", :sugar => "3/4 cup", :chocolate_chips => '1 cup'})
pb_cookie = PeanutButter.new({:flour => "1 cup", :sugar => "3/4 cup", :peanut_butter => '1/4 cup'})

puts pb_cookie
puts cc_cookie
puts cookie
```
