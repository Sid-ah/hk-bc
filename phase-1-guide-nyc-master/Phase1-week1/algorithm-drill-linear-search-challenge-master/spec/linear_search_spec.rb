require_relative '../linear_search'

describe 'linear_search' do
  let(:symbols) { [:Q, :O, :A, :A, :C, :G, :S, :U] }

  context 'when the array contains the searched-for element' do
    it 'returns the index of the first occurrence of the element' do
      index_of_a = linear_search(:A, symbols)
      expect(index_of_a).to eq 2
    end
  end

  context 'when the array does not contain the searched-for element' do
    it 'returns nil if the element cannot be found' do

      raise <<-STUDENT_INSTRUCTIONS

      Hey DBC Student! We raised this error intentionally :D

      Please go here: #{__FILE__}:#{__LINE__}

      and replace the giant raise statement with test code written by you, the student."

      .
      STUDENT_INSTRUCTIONS


    end
  end
end


describe 'global_linear_search' do

end
