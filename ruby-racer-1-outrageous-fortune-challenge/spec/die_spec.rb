require_relative '../die'

describe Die do
  describe 'the number of sides' do
    it 'has six sides by default' do
      expect(Die.new.side_count).to eq 6
    end

    it 'can be created with a different number of sides' do
      expect(Die.new(3).side_count).to eq 3
    end
  end

  describe 'rolling the die' do
    it 'returns a number from one to the number of sides' do
      die = Die.new
      expect((1..die.side_count)).to cover die.roll
    end
  end
end
