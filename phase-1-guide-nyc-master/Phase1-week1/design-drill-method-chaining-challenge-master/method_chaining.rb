# Refactor for elegance
def shout_backwards(string)
  all_caps  = string.upcase
  backwards = all_caps.reverse
  result    = backwards + "!!!"

  return result
end


# This is convoluted. Refactor for clarity.
def squared_primes(array)
  array.find_all{|x| (2..x-1).select(){|i| x % i == 0}.count == 0 && x > 1}.map{|p| p*p}
end
