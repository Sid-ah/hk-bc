require_relative '../tip_calculator'

describe TipCalculator do
  describe 'the customary percentage' do
    it 'has a customary percentage' do
      expect(TipCalculator).to respond_to :customary_percentage
    end

    it 'relies on the value of $global_tip_percentage' do
      $global_tip_percentage = 0.0
      expect(TipCalculator.customary_percentage).to eq 0.0
    end

    it 'can reassign the customary percentage' do
      expect { TipCalculator.customary_percentage = 1.0 }.to change { TipCalculator.customary_percentage }.to 1.0
    end

    it 'reassigns $global_tip_percentage when it reassigns the customary percantage' do
      expect { TipCalculator.customary_percentage = 0.5 }.to change { $global_tip_percentage }.to 0.5
    end
  end

  it 'calculates a tip based on the customary percentage' do
    TipCalculator.customary_percentage = 0.25
    bill = 10.00

    expect(TipCalculator.customary_tip(bill)).to eq "$2.50"
  end
end
