# Remember, the rational numbers are the set of numbers
# that can be expressed as a ratio two of integers, like
# 1/2, 10234/567, 0/1, -4/5, etc.
#
# We write them as X/Y where X is called the "numerator"
# and Y is called the "denominator."  This notation is
# 100% convention.  We could just as easily write them
# as (X,Y) or X:Y or X|Y.
#
# For this exercise it's important to think about a
# rational number as a pair of integers with special
# addition, subtraction, multiplication, etc. operations
# and their own notion of equality.
#
# For example, we say that two rational numbers a/b and c/d
# are "equal" if a*d equals b*c.  This "equals" is defined
# in terms of the word "equals" for the integers -- we're equivocating
# a bit by re-using the same word.

class RationalNumber
  attr_reader :numerator, :denominator
  
  def initialize(numerator, denominator)
    @numerator = numerator
    @denominator = denominator
  end
  
  # Addition
  def +(rational)
  end
  
  # Subtraction
  def -(rational)
  end
  
  # Multiplication
  def *(rational)
  end
  
  # Division
  def /(rational)
  end
  
  # Exponentiation
  def **(integer)
  end
  
  # The reciprocal, with an example
  def reciprocal
    RationalNumber.new(self.denominator, self.numerator)
  end
  
  # For, e.g., 1/3 should return -1/3
  # That is, rat + rat.inverse == RationalNumber(0,1)
  def inverse
  end
  
  # Returns true if this rational is equal the the input
  # Remember that RationalNumber.new(1,2) == RationalNumber(2,4)
  def ==(rational)
  end
  
  def to_s
    "(#{self.numerator}/#{self.denominator})"
  end
end