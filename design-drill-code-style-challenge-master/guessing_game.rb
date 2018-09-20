class Guessing_game
  VALID_Numbers = (1..100).to_a # Store valid answers in an array

  def initialize answer; @answer = answer
@solved = false
# Validate input
  raise "Answer must be between 1 and 100" unless VALID_Numbers.include? @answer
  end

def guess ( number )
if number == @answer # Check if the two are equal
@solved = true
      :correct
  elsif (number > @answer) # Check if the guess is higher
@solved = false
    return :high
elsif(number<@answer) # Check if the guess is lower
      @solved = false
    :low
end
  end

  def solved?
  @solved
end
end
