require_relative('../guessing_game')

describe Guessing_game do
  let(:game) { Guessing_game.new(10) }

  describe '#guess' do
    it 'alerts if a guess is too low' do
      expect(game.guess(5)).to eq(:low)
    end

    it 'alerts if a guess is too high' do
      expect(game.guess(15)).to eq(:high)
    end
  end

  describe '#solved?' do
    it 'returns true if the puzzle has been solved' do
      game.guess(10)
      expect(game.solved?).to be(true)
    end

    it 'returns false if the puzzle has not been solved' do
      expect(game.solved?).to be(false)
    end
  end

  context 'with a number greater than 100' do
    it 'raises an error' do
      expect { Guessing_game.new(200)}
        .to raise_exception(RuntimeError, "Answer must be between 1 and 100")
    end
  end
end
