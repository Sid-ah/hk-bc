require_relative '../borg'

describe Borg do
  describe 'class behaviors' do
    it 'returns the number of instances that have been created' do
      expect(Borg.count).to eq 0
    end

    it 'increases its count each time a new instance is created' do
      expect { Borg.new }.to change { Borg.count }.by(1)
    end
  end

  describe 'instance behaviors' do
    let(:borg) { Borg.new }

    it 'has a name based on the number of borg created' do
      current_borg_count = Borg.count
      expected_name = "#{current_borg_count + 1} of #{current_borg_count + 1}"

      expect(borg.name).to eq expected_name
    end

    it 'changes name when the number of borg changes' do
      current_borg_count = Borg.count
      expected_name = "#{current_borg_count + 1} of #{current_borg_count + 1}" # e.g., "2 of 2"

      expect(borg.name).to eq expected_name

      expected_name_after_next_borg_created = "#{current_borg_count + 1} of #{current_borg_count + 2}" # e.g., "2 of 3"

      expect { Borg.new }.to change { borg.name }.to expected_name_after_next_borg_created
    end
  end
end
