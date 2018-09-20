require_relative('../method_chaining')

describe "shout_backwards" do
  it 'returns a loud, backwards string' do
    expect(shout_backwards("hello, boot")).to eq("TOOB ,OLLEH!!!")
  end
end

describe "squared_primes" do
  it 'returns an array of the prime numbers, squared' do
    actual_result = squared_primes([1, 3, 4, 7, 42])
    expected_result = [9, 49]

    expect(actual_result).to match_array(expected_result)
  end
end
