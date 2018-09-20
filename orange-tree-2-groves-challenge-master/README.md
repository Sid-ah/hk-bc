# Model a Grove of Different Trees

## Summary
In [another challenge][orange tree challenge] we modeled an orange tree for our client, Fran the Farmer.  We were able to model for her the production of an orange tree over the course of its lifetime.  She was satisfied enough with our work that she's engaging us on another project.  Her orange farm is considering the acquisition of a neighboring tree grove, a grove that includes varieties of trees beyond orange trees.

We're going to build a simple model of a tree grove.  We'll begin with our  orange tree and use it as a pattern for modeling an apple tree.  Once we have the two tree classes and the corresponding fruit classes, we'll take time to refactor our code.  Once our code is refactored, we'll add an additional tree type:  pear trees.  Finally, we'll model the tree grove.


### Inheritance
When we later refactor our code, we'll use *inheritance* to eliminate the repetition that exists in what will then be our `OrangeTree` and `AppleTree` classes.  We'll create a general `FruitTree` class, from which we can create more specific classes of trees:  orange, apple, and later pear.  Our generic fruit tree model will provide the basic behaviors of our trees: they grow, they mature, they die, etc.  The orange, apple, and pear trees will share the same basic behaviors, but each will differ in its implementation: one tree produces oranges, another apples; one tree dies at age 100, another at 45; and so on.  See Table 1.

For more information on inheritance in Ruby, see this [description from learningruby.com][rubylearning.com inheritance].

|                    | orange trees | apple trees | pear trees |
| ------------------ | -----------: | ----------: | ---------: |
| maximum height     | 25           | 26          | 20         |
| growth rate        | 2.5          | 2           | 2.5        |
| annual fruit yield | 100 - 300    | 400 - 600   | 175 - 225  |
| age of maturity    | 6            | 5           | 5          |
| age of death       | 100          | 45          | 40         |
| type of fruit      | oranges      | apples      | pears      |

*Table 1*.  Data for orange, apple, and pear trees.



## Releases
### Pre-release:  Copy the Orange Tree Model
Before we begin, copy the code from the orange tree challenge.  Bring over both the code for the orange tree and the orange fruit.  Bring the tests, too, and make sure that they are passing.


### Release 0: Apples and Apple Trees
We have an `OrangeTree` class with a public interface:  methods like `#age`, `#mature?`, `#dead?`, etc.  We are going to create an `AppleTree` class that copies this exact interface.  In other words, the messages that we send to an orange tree will be the same that we send to an apple tree.

However, while orange trees and apples trees will have the same behaviors, they will have different life cycles.  They'll produce fruit at different ages, grow at different rates, die at different ages, etc.  The particulars for each tree type can be found in Table 1.

Start by writing tests for the `AppleTree` class.  Use the tests for the orange tree as a pattern, modifying them for the particulars of an apple tree.  Then, implement the class itself.  Don't forget to create an `Apple` class as well; we wouldn't want an apple tree that produces oranges.



### Release 1: From Specific Types to a General Type
We have now modeled two specific types of fruit tree.  Our orange and apple trees behave very similarly.  Based on the similarities in behavior among the two types of tree, we can create a more generalized case: a fruit tree.

We can create a `FruitTree` class with generalized behaviors.  Our `OrangeTree` and `AppleTree` classes can inherit behaviors from this general class and implement their own specifics.  For example, both orange trees and apple trees have a height.  With each passing season, the trees grow by some amount until they reach a maximum height.  This is the general behavior that can be represented in a general fruit tree model.  That general behavior would be inherited by each of the specific types of fruit tree with each specific type defining how much it grows each year and its own maximum height.


```ruby
class FruitTree
  # define the class
end

class OrangeTree < FruitTree
  # define the class
end

class AppleTree < FruitTree
  # define the class
end
```
*Figure 1*. Defining `OrangeTree` and `AppleTree` classes which inherit from a `FruitTree` superclass or parent class.


Define a `FruitTree` class and modify the `OrangeTree` and `AppleTree` classes to inherit from it (see Figure 1).  Incrementally move the shared behaviors from the specific trees to the general tree.  Do the same for our fruit classes.

As we do so, our tests should continue to pass—we might need to make small updates to our tests if we change our method names, but we shouldn't need to change the logic of our tests. That's the beauty of tests, they're a safety net when we engage in large refactors like this one. If our tests continue to pass, we know we're in good shape. If not, we get to catch our mistakes early.


### Release 2: Pears and Pear Trees
Now that we have a generalized fruit tree model from which we can derive specific types of trees, we'll take advantage of this by creating an additional tree type:  `PearTree`.

Yep, we need to write tests for this type of tree, too. It might feel like the tests for each class are repetitious and that writing them involves a lot of copying and pasting with minor edits.  RSpec does have ways to DRY-ly and more elegantly test shared behaviors, but don't worry about that just yet.  All in good time.


### Release 3: Model the Tree Grove

|                  | Age 0 | Age 5 | Age 20 | Age 37 | Age 50 | Total Count |
| :--------------- | ----: | ----: | -----: | -----: | -----: | ----------: |
| **orange trees** | 0     | 20    | 20     | 10     | 20     | 70          |
| **apple trees**  | 10    | 10    | 20     | 20     | 5      | 65          |
| **pear trees**   | 10    | 0     | 10     | 20     | 10     | 50          |


*Table 2*.  The number of trees in the grove by type and age.


Now that we have a model for each tree type in the grove, let's build a model of the grove.  Data for the grove's trees is in Table 2.  We can see how many trees are in the grove, their types, and their ages.  Using orange trees as an example, the grove has a total of 70 orange trees.  20 of the orange trees are five years old, 20 of the orange trees are 20 years old, ten of the orange trees are 37 years old, and 20 of the orange trees are 50 years old.

Define a `TreeGrove` class that will be responsible for managing the trees in the grove.  Here is a list of some initial behaviors for the class.

1. A tree grove can be initialized with an array of trees.
2. A tree grove can return different subsets of its trees:  all the trees, just trees of one type, just trees that are mature, etc.
3. When a tree grove passes a growing season, each of its trees passes a season.

*Hint:* We might want to edit our trees.  For example, we might want to initialize them with a given age and height.


### Release 4:  Model Expected Production
It's time to put our models to use.  Fran wants us to generate a report of the grove's expected production over the next 10 growing seasons.  For each season, our report should specify (1) how many oranges, apples, and pears our model would expect to be produced each season, (2) the average size of each type of fruit, and (3) for each type of tree, we should detail how many immature, mature, dead and total trees are in the grove.  (See [example report][])


## Conclusion
In this challenge, we've begun to explore inheritance.  It's a way to share behavior among similar types of objects, which can make our code easier to maintain.  Inheritance is only appropriate when the subclass (e.g., `OrangeTree`) is a specific type of the superclass (e.g., `FruitTree`).  We'll have more opportunities to explore inheritance and how it's implemented in Ruby as we proceed through Dev Bootcamp.


[example report]: readme-assets/example_report.md
[orange tree challenge]: ../../../orange-tree-1-just-oranges-challenge
[rubylearning.com inheritance]: http://rubylearning.com/satishtalim/ruby_inheritance.html
