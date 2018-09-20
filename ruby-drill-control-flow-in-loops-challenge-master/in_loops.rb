# Generic looping method: no break, next, or return
def loop_no_extras
  numbers = []
  counter = 0

  while counter < 20
    counter += 1
    numbers << counter
  end

  numbers
end


# Loops with a break condition
def loop_with_break
  numbers = []
  counter = 0

  while counter < 20
    counter += 1
    break if counter == 11
    numbers << counter
  end

  numbers
end


# Loops with a next condition
def loop_with_next
  numbers = []
  counter = 0

  while counter < 20
    counter += 1
    next if counter.even?
    numbers << counter
  end

  numbers
end


# Loops with a return condition
def loop_with_return
  numbers = []
  counter = 0

  while counter < 20
    counter += 1
    return counter if counter == 5
    numbers << counter
  end

  numbers
end
