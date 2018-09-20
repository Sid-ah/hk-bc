require_relative '../spec_helper'

describe EntryControllerHelper do
  before(:all) do
    class DummyClass
      include EntryControllerHelper
    end
  end

  let(:instance) { DummyClass.new }

  describe '#find_and_ensure_entry' do
    let(:id) { 100 }

    before :each do
      allow(instance).to receive(:erb)
    end

    it 'halts if entry does not exist' do
      expect(Entry)
        .to receive(:find_by)
        .with(id: id)
        .and_return(nil)

      expect(instance).to receive(:halt)

      expect(instance.find_and_ensure_entry(id))
        .to eq(nil)
    end

    it 'halts if entry does not exist' do
      entry = double(:entry)
      expect(Entry)
        .to receive(:find_by)
        .with(id: id)
        .and_return(entry)

      expect(instance).to_not receive(:halt)

      expect(instance.find_and_ensure_entry(id))
        .to eq(entry)
    end
  end
end
