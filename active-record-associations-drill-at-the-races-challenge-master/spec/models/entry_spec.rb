require 'spec_helper'

describe Entry do
  describe 'associations' do
    before(:each) do
      @entered_race = Race.create!(name: 'Pretty High Stakes', location: 'Raceway Park', date: (Date.today - 2.months))
      @unentered_race = Race.create!(name: 'Double Time Derby', location: 'Raceway Park', date: (Date.today - 2.months))

      @entered_jockey = Jockey.create!(name: 'Aston')
      @unentered_jockey = Jockey.create!(name: 'Adebola')

      @ridden_horse = Horse.create!(name: 'Nitro')
      @unridden_horse = Horse.create!(name: 'Hot Shot')

      @entry = Entry.create!(race_id: @entered_race.id, jockey_id: @entered_jockey.id, horse_id: @ridden_horse.id)
    end

    it 'returns the entered jockey' do
      expect(@entry.jockey).to eq @entered_jockey
    end

    it 'returns the horse ridden' do
      expect(@entry.horse).to eq @ridden_horse
    end

    it 'returns its entered race' do
      expect(@entry.race).to eq @entered_race
    end
  end
end
