## OO Terminology
- Single Responsibility, Separation of Concerns
- Reducing Dependencies, Decoupling, Law of Demeter, 
  - Tell don't Ask  (Tell, don't ask then tell)
  - What vs How  (Intent vs Implementation)


### SEPARATION OF CONCERNS AND SINGLE RESPONSIBILITY

Original code from Oranges exercise:

```ruby
def age!
  return if self.dead?   
  @age = @age + 1
  @height = @height + 2

  if age >= @starts_fruit
    5.times do 
      @oranges << Orange.new.diameter
    end     
  end 
end  
```

Refactored code:

```ruby
def age!
  return if self.dead?   
  increase_age
  increase_height
  generate_fruit
end

def increase_age
  @age = @age + 1
end

def increase_height
  @height = @height + 2
end 

def generate_fruit
  if age >= @starts_fruit
    5.times do 
     @oranges << Orange.new.diameter
    end 
  end     
end 
```

####Original code from World's Simplest Browser


```ruby
class Browser
  def run!
    puts "Welcome to the simplest browser in the world"
    print "url>"
    page = gets.chomp
    page = Page.new(page)
    page.fetch!
    puts "Fetching..."
    puts "Title: #{page.title}"
    puts "Content length: #{page.length}"
    puts "Links:"
    puts page.links
  end
end
```

Refactored code:

```ruby
module UI

  def welcome_prompt
    puts "Welcome to the simplest browser in the world"
    print "url>"
  end

  def output_results
    puts "Fetching..."
    puts "Title: #{page.title}"
    puts "Content length: #{page.length}"
    puts "Links:\n#{page.links}"
  end

end

class Browser

  include UI

  def initialize
    @page = ''
  end

  def run!
    welcome_prompt
    get_url      
    create_page
    fetch!(@page)
    output_results
  end

  def get_url
    @page = gets.chomp
  end

  def create_page
    @page = Page.new(@page)
  end  
 
end
```


###TELL DON'T ASK

```ruby
crawler = Crawler.new('links_list.txt')
while crawler.has_links_to_visit?
  link = crawler.next_link_to_visit
  Parser.process(link)
end
```

Refactored code:

```ruby
crawler = Crawler.new('links_list.txt')
crawler.each_link {|link| Parser.process(link) } 
```

This is a good example of the Tell don't Ask principle. In the first
snippet of code we were continually asking "are there anymore links
to look at?" If there were, then we were asking for the next link and
then performing an operation on it. In the second sample of code all 
we were doing was saying "do this thing on every link." Which is
more straightforward and clear. It is much easier to conceptualize "Do
X to all the links" than it is to think through "Okay, are there any 
more links? Yes, Okay give me the next link. Do X to the link. Now are
there anymore links? Yes, Okay give me the next link. Do X to the link.
Now are there anymore links? ... "o


###WHAT VS HOW

```ruby
tree = Tree.new
tree.oranges << Array.new(10, Orange.new) 
tree.oranges.each do |orange|
  ripe_oranges << orange if orange.yumminess == ":mmmmmm"
end
puts ripe_oranges
```


###Tell what you want, not how to do it!

```ruby
tree.grow_oranges(10, Orange.new)
puts tree.ripe_oranges

class Tree
  def ripe_oranges
    self.oranges.select { |orange| orange.yummy? }
    # self.oranges.select {&:yummy?}
  end
end
```

###LAW OF DEMETER
"The fundamental notion is that a given object should assume as 
little as possible about the structure or properties of anything 
else (including its subcomponents)."
"Only talk to neighbors." "Use only one dot."


```ruby
orchard = Orchard.new
orchard.add_tree(tree)
orchard.trees.each.oranges.each   { |orange| puts orange.yummy? }
```

Refactored code:

```ruby
orchard.all_ripe_fruit.each { |fruit| puts fruit }
```

Why is it better to decouple the orchard, trees and oranges?
What if there are oranges that have fallen on the ground but are still ripe?

This would not be actually abiding the Law of Demeter:
```ruby
def all_ripe_fruit
  orchard.trees.each.oranges.each   { |orange| puts orange.yummy? }
end
```

The above only hides the coupling in the `all_ripe_fruit` method.  This instead would help decouple the orchard, trees, and fruit:

```ruby
def all_ripe_fruit
  trees.ripe_fruit
end
```



