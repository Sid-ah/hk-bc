require 'spec_helper'

describe Race do
  describe 'associations' do
    before(:each) do
      @race = Race.create!(name: 'Pretty High Stakes', location: 'Raceway Park', date: (Date.today - 2.months))

      @entered_jockey_1 = Jockey.create!(name: 'Aston')
      @entered_jockey_2 = Jockey.create!(name: 'Coby')
      @unentered_jockey = Jockey.create!(name: 'Parris')

      @entered_horse_1 = Horse.create!(name: 'Nitro')
      @entered_horse_2 = Horse.create!(name: 'All Star')
      @unentered_horse = Horse.create!(name: 'Hot Shot')

      Entry.create!(race_id: @race.id, jockey_id: @entered_jockey_1.id, horse_id: @entered_horse_1.id)
      Entry.create!(race_id: @race.id, jockey_id: @entered_jockey_2.id, horse_id: @entered_horse_2.id)
    end

    it 'returns the entered jockeys' do
      expect(@race.jockeys).to match_array [@entered_jockey_1, @entered_jockey_2]
    end

    it 'returns the horses ridden in the race' do
      expect(@race.horses).to match_array [@entered_horse_1, @entered_horse_2]
    end
  end
end
