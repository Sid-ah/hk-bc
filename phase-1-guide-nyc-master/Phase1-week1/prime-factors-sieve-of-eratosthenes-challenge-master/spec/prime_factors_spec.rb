require_relative '../prime_factors'

describe 'sieve_of_eratosthenes' do
end

describe 'prime_factors' do
  it 'returns an empty collection for 1' do
    expect(prime_factors 1).to be_empty
  end

  it 'returns prime numbers in a collection by themselves' do
    primes = [2, 3, 5, 7, 11]

    primes.each do |prime_number|
      expect(prime_factors prime_number).to match_array [prime_number]
    end
  end

  it 'returns prime factorization of non-prime numbers greater than 1' do
    known_factorizations = {
      4          => [2, 2],
      6          => [2, 3],
      8          => [2, 2, 2],
      9          => [3, 3],
      10         => [2, 5],
      12         => [2, 2, 3],
      873        => [3, 3, 97],
      12056      => [2, 2, 2, 11, 137],
      123123123  => [3, 3, 41, 333667]
    }

    known_factorizations.each do |number, prime_factorization|
      expect(prime_factors number).to match_array prime_factorization
    end
  end
end
