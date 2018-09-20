def sieve_of_eratosthenes(number)
end

def prime_factors(number)
  return Array.new if number < 2

  first_prime_factor = find_first_prime_factor_of(number)
  [first_prime_factor] + prime_factors(number / first_prime_factor)
end

def find_first_prime_factor_of(number)
  possible_factors(number).each do |possible_factor|
    if is_prime?(possible_factor) && is_factor_of?(number, possible_factor)
      return possible_factor
    end
  end

  number
end

def possible_factors(number)
  (1..square_root_of(number))
end

def square_root_of(number)
  Math.sqrt number
end

def is_prime?(number)
  number > 1 && !has_factors_other_than_one_and_self?(number)
end

def is_factor_of?(number, possible_factor)
  (number % possible_factor).zero?
end

def has_factors_other_than_one_and_self?(number)
  (factors(number) - [1, number]).any?
end

def factors(number)
  possible_factors(number).select { |possible_factor| is_factor_of?(number, possible_factor) }
end
