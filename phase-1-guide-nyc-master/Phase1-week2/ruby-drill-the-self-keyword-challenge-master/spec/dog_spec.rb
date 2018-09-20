require_relative '../dog'

describe Dog do
  let(:dog) { Dog.new(name: 'Jayda', breed: 'English Bull Terrier') }

  it 'has a name' do
    expect(dog.name).to eq 'Jayda'
  end

  it 'has a breed' do
    expect(dog.breed).to eq 'English Bull Terrier'
  end

  describe 'behaviors of the Dog class itself' do
    describe '.create_multiple, creating multiple dogs at the same time' do
      let(:doggie_data) do
        [ { name: 'Jayda', breed: 'English Bull Terrier' },
          { name: 'Tenley', breed: 'Golden Doodle' }]
      end

      let(:multiple_dogs) { Dog.create_multiple(doggie_data) }

      it 'returns an iterable collection' do
        expect(multiple_dogs).to respond_to :each
      end

      it 'assigns attributes correctly' do
        # The first dog in the returned collection has the correct name
        expect(multiple_dogs.first.name).to eq 'Jayda'

        # The last dog in the returned collection has the correct breed
        expect(multiple_dogs.last.breed).to eq 'Golden Doodle'
      end
    end
  end
end
