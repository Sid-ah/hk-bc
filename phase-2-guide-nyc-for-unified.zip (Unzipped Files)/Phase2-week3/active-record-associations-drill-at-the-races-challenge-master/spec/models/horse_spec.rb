require 'spec_helper'

describe Horse do
  describe 'associations' do
    before(:each) do
      @entered_race_1 = Race.create!(name: 'Pretty High Stakes', location: 'Raceway Park', date: (Date.today - 2.months))
      @entered_race_2 = Race.create!(name: 'Classy Cup', location: 'Raceway Park', date: (Date.today - 1.month))
      @unentered_race = Race.create!(name: 'Double Time Derby', location: 'Raceway Park', date: (Date.today - 2.months))

      @carried_jockey_1 = Jockey.create!(name: 'Aston')
      @carried_jockey_2 = Jockey.create!(name: 'Beverly')
      @uncarried_jockey = Jockey.create!(name: 'Adebola')

      @horse = Horse.create!(name: 'Nitro')

      Entry.create!(race_id: @entered_race_1.id, jockey_id: @carried_jockey_1.id, horse_id: @horse.id)
      Entry.create!(race_id: @entered_race_2.id, jockey_id: @carried_jockey_2.id, horse_id: @horse.id)
    end

    it 'returns the races in which it was ridden' do
      expect(@horse.ridden_in_races).to match_array [@entered_race_1, @entered_race_2]
    end

    it 'returns the jockeys its carried' do
      expect(@horse.carried_jockeys).to match_array [@carried_jockey_1, @carried_jockey_2]
    end
  end
end
