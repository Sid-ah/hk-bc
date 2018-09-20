require 'spec_helper'

describe Jockey do
  describe 'associations' do
    before(:each) do
      @entered_race_1 = Race.create!(name: 'Pretty High Stakes', location: 'Raceway Park', date: (Date.today - 2.months))
      @entered_race_2 = Race.create!(name: 'Classy Cup', location: 'Raceway Park', date: (Date.today - 1.month))
      @unentered_race = Race.create!(name: 'Double Time Derby', location: 'Raceway Park', date: (Date.today - 2.months))

      @jockey = Jockey.create!(name: 'Aston')

      @ridden_horse_1 = Horse.create!(name: 'Nitro')
      @ridden_horse_2 = Horse.create!(name: 'All Star')
      @unridden_horse = Horse.create!(name: 'Hot Shot')

      Entry.create!(race_id: @entered_race_1.id, jockey_id: @jockey.id, horse_id: @ridden_horse_1.id)
      Entry.create!(race_id: @entered_race_2.id, jockey_id: @jockey.id, horse_id: @ridden_horse_2.id)
    end

    it 'returns its entered races' do
      expect(@jockey.entered_races).to match_array [@entered_race_1, @entered_race_2]
    end

    it 'returns the horses its ridden' do
      expect(@jockey.ridden_horses).to match_array [@ridden_horse_1, @ridden_horse_2]
    end
  end
end
