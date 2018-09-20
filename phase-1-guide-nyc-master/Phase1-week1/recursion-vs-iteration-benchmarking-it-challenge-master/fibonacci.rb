def iterative_nth_fibonacci_number(n)
  sequence = [0, 1]

  until sequence[n]
    sequence << sequence.last(2).reduce(:+)
  end

  sequence[n]
end

def recursive_nth_fibonacci_number(n)
  return 0 if n == 0
  return 1 if n <= 2

  recursive_nth_fibonacci_number(n - 1) + recursive_nth_fibonacci_number(n - 2)
end
