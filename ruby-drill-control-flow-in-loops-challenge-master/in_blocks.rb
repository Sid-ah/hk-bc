# Executes a block with no calls to next, break, or return
def run_block_no_extras
  numbers = []

  (1..20).each do |number|
    numbers << number
  end

  numbers
end

# Executes a block with a next contition
def run_block_with_next
  numbers = []

  (1..20).each do |number|
    next if number.odd?
    numbers << number
  end

  numbers
end

# Executes a block with a break contition
def run_block_with_break
  numbers = []

  (1..20).each do |number|
    break if number == 11
    numbers << number
  end

  numbers
end

# Executes a block with a return contition
def run_block_with_return
  numbers = []

  (1..20).each do |number|
    return number if number == 11
    numbers << number
  end

  numbers
end
