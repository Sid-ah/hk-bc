def factorial_iterative(n)
  (1..n).reduce(1, :*)
end

def factorial_recursive(n)
  return 1 if n < 2
  n * factorial_recursive(n - 1)
end
