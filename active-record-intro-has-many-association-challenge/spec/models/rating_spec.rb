require_relative '../spec_helper'

describe "Rating" do
  it "is an Active Record model" do
    expect(Rating.new).to be_a_kind_of ActiveRecord::Base
  end

  describe 'associations' do
    before(:each) do
      @owner = Person.create(first_name: 'Taylor',  last_name: 'Long-Hurst')
      @dog = Dog.create(name: 'Jayda', license: 'OH-4893720', age: 3, breed: 'Bull Terrier', owner_id: @owner.id)
      @judge = Person.create(first_name: 'Evan', last_name: 'Strange')
      @rating = Rating.create(coolness: 10, cuteness: 7, dog_id: @dog.id, judge_id: @judge.id)
    end

    describe 'a rating belongs to a dog' do
      describe '#dog' do
        it 'returns the dog that was rated' do
          expect(@rating.dog).to eq @dog
        end

        it 'returns a dog object' do
          expect(@rating.dog).to be_an_instance_of Dog
        end
      end

      describe '#dog=' do
        it 'assigns the dog that was rated' do
          other_dog = Dog.create(name: 'Tenley', license: 'OH-9384764', age: 1, breed: 'Golden Doodle', owner_id: @owner.id)
          expect { @rating.dog = other_dog }.to change { @rating.dog }.to other_dog
        end
      end
    end

    describe 'a rating belongs to a judge' do
      describe '#judge' do
        it 'returns the judge that did the rating' do
          expect(@rating.judge).to eq @judge
        end

        it 'returns a person object' do
          expect(@rating.judge).to be_an_instance_of Person
        end
      end

      describe '#judge=' do
        it 'assigns the judge that was rated' do
          other_judge = Person.create(first_name: 'Poppy', last_name: 'Jakeman')
          expect { @rating.judge = other_judge }.to change { @rating.judge }.to other_judge
        end
      end
    end
  end
end
