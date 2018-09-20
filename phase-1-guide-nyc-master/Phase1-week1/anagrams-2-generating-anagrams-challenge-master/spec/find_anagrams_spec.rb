require_relative '../find_anagrams'

describe 'find_anagrams' do
  it 'returns any anagrams from the provided list' do
    possible_anagrams = ['nighthawks', 'caret', 'react', 'trace', 'otters']
    found_anagrams    = find_anagrams('crate', possible_anagrams)

    expect(found_anagrams).to match_array ['caret', 'react', 'trace']
  end
end
