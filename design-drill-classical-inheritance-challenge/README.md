# Design Drill Classical Inheritance 
 
##Learning Competencies 

* Use inheritance to model problems, and effectively implement inheritance in ruby

##Summary 

 Inheritance is a design pattern that can be found in almost every modern programming language in some form or another.

If you're not sure why inheritance is important or useful, just think about why we have DNA.  Hmm?

Here's a simple explanation from [Programming Ruby](http://pragprog.com/book/ruby3/programming-ruby-1-9) (a.k.a. the *Pickaxe*):

> Inheritance allows you to create a class that is a refinement or specialization of another class.  This class is called a **subclass** of the original, and the original is a **superclass** of the subclass.  People also talk of **child** and **parent** classes.
> The basic mechanism of subclassing is simple.  The child inherits all of the capabilities of its parent class--all the parent's instance methods are available in instances of the child.

Additionally, you may want to [read about inheritance in Ruby](http://rubylearning.com/satishtalim/ruby_inheritance.html) to get a sense for how it works.

##Releases

###Release 0 : A bunch of animals

Define 7 empty classes: `Animal` `Mammal`, `Amphibian`, `Primate`, `Frog`, `Bat`, and `Chimpanzee`.

Set up an inheritance structure that makes sense given the phylogenetic position of the animal in relation to the others.

**Note:** You should time box the set up of this inheritance structure. You do not need to create the perfect taxonomy.

#### Add some properties

Add instance variables and methods to your different classes.  These could include things like `@num_legs` or `warm_blooded?`.  Make up your own.

The write a script to prove that your inheritance structure works.  If you assign `@num_legs = 2` in the `Primate` class, does an instance of `Chimpanzee` have the same variable and value?

Hint: you may have to define some reader methods.

###Release 1 : Super powers with a Module

Create a module `SuperPowers` with some crazy (and perfectly useless) features like a `use_laser_vision` method and a `magic_points` reader and writer method.

Then use your module as a mixin for one or more of your classes.


<!-- ##Optimize Your Learning  -->

##Resources

* [read about inheritance in Ruby](http://rubylearning.com/satishtalim/ruby_inheritance.html)