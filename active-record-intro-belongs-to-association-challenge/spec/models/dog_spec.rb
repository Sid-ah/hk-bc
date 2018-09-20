require_relative '../spec_helper'

describe Dog do
  it 'is an Active Record model' do
    expect(Dog.new).to be_a_kind_of ActiveRecord::Base
  end

  describe 'associations' do
    describe 'a dog belongs to an owner' do
      before(:each) do
        @owner = Person.create(first_name: 'Teagan', last_name: 'Hickman')
        @dog = Dog.create(name: 'Tenley', license: 'OH-9384764', age: 1, breed: 'Golden Doodle', owner_id: @owner.id)
      end

      describe '#owner' do
        it 'returns the dog\'s owner' do
          expect(@dog.owner).to eq @owner
        end

        it 'returns a person object' do
          expect(@dog.owner).to be_an_instance_of Person
        end
      end

      describe '#owner=' do
        it 'assigns the owner' do
          new_owner = Person.create(first_name: 'Dotty', last_name: 'Massey')
          expect { @dog.owner = new_owner }.to change { @dog.owner }.to new_owner
        end
      end
    end
  end
end
