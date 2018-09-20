require_relative '../spec_helper'

describe DateFormatting do
  before(:all) do
    class DummyClass
      include DateFormatting
    end
  end

  let(:instance) { DummyClass.new }

  describe '#long_form_date' do
    it 'presents a timestamp in "Month Day, Year" format' do
      timestamp = Time.new(2015, 04, 15)
      expect(instance.long_form_date(timestamp)).to eq "April 15, 2015"
    end
  end
end
