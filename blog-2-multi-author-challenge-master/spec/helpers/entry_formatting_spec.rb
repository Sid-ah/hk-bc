require_relative '../spec_helper'

describe EntryFormatting do
  before(:all) do
    class DummyClass
      include EntryFormatting
    end
  end

  let(:instance) { DummyClass.new }

  describe '#stub' do
    context 'text has more than twentyfive words' do
      it 'returns the first twentyfive words' do
        text = "One two three. \"Four five six\" seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen. Seventeen eighteen! Nineteen twenty twentyone twentytwo twentythree twentyfour twentyfive twentysix twentyseven twentyeight twentynine thirty."
        stubbed_text = instance.stub(text)

        expect(stubbed_text).to eq "One two three. \"Four five six\" seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen. Seventeen eighteen! Nineteen twenty twentyone twentytwo twentythree twentyfour twentyfive ..."
      end
    end

    context 'text has twentyfive or less words' do
      it 'returns the original text' do
        text = "One two three. \"Four five six\" seven eight nine ten eleven twelve thirteen fourteen fifteen sixteen. Seventeen eighteen! Nineteen twenty twentyone twentytwo twentythree twentyfour twentyfive."
        stubbed_text = instance.stub(text)

        expect(stubbed_text).to eq text
      end
    end

  end
end
