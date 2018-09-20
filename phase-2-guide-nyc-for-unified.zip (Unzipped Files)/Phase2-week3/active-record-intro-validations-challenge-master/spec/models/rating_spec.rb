require_relative '../spec_helper'

describe Rating do
  it 'is an Active Record model' do
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

  describe 'validations' do
    before(:each) do
      @owner = Person.create(first_name: 'Taylor',  last_name: 'Long-Hurst')
      @dog = Dog.create(name: 'Jayda', license: 'OH-4893720', age: 3, breed: 'Bull Terrier', owner_id: @owner.id)
      @judge = Person.create(first_name: 'Evan', last_name: 'Strange')
    end

    let(:valid_details) do
      { coolness: 10, cuteness: 7, dog_id: @dog.id, judge_id: @judge.id }
    end

    it 'requires a value for coolness' do
      rating = Rating.new valid_details.except(:coolness)
      expect(rating).to be_invalid
    end

    it 'requires coolness to be at least 1' do
      rating = Rating.new valid_details.merge(coolness: 0)
      expect(rating).to be_invalid
    end

    it 'requires coolness to be no more than 10' do
      rating = Rating.new valid_details.merge(coolness: 11)
      expect(rating).to be_invalid
    end

    it 'requires a value for cuteness' do
      rating = Rating.new valid_details.except(:cuteness)
      expect(rating).to be_invalid
    end

    it 'requires cuteness to be at least 1' do
      rating = Rating.new valid_details.merge(cuteness: 0)
      expect(rating).to be_invalid
    end

    it 'requires cuteness to be no more than 10' do
      rating = Rating.new valid_details.merge(cuteness: 11)
      expect(rating).to be_invalid
    end

    describe 'requires a judge' do
      it 'is invalid without a judge_id' do
        rating = Rating.new valid_details.except(:judge_id)
        expect(rating).to be_invalid
      end

      it 'is invalid if judge_id points to a record that doesn\'t exist' do
        nonexistant_judge_id = Person.pluck(:id).max + 1

        rating = Rating.new valid_details.merge(judge_id: nonexistant_judge_id)
        expect(rating).to be_invalid
      end
    end

    describe 'requires a dog' do
      it 'is invalid without a dog_id' do
        rating = Rating.new valid_details.except(:dog_id)
        expect(rating).to be_invalid
      end

      it 'is invalid if dog_id points to a record that doesn\'t exist' do
        nonexistant_dog_id = Dog.pluck(:id).max + 1

        rating = Rating.new valid_details.merge(dog_id: nonexistant_dog_id)
        expect(rating).to be_invalid
      end
    end

    describe 'preventing duplicate ratings' do
      it 'a judge can rate different dogs' do
        Rating.create!(valid_details)
        new_dog = Dog.create!(name: 'Tenley', license: 'OH-9384764', age: 1, breed: 'Golden Doodle', owner_id: @owner.id)

        same_judge_different_dog_rating = Rating.new valid_details.merge(dog_id: new_dog.id)
        expect(same_judge_different_dog_rating).to be_valid
      end

      it 'a dog can be rated by different judges' do
        Rating.create!(valid_details)
        new_judge = Person.create!(first_name: 'Ramlah', last_name: 'Winthrop')

        same_dog_different_judge_rating = Rating.new valid_details.merge(judge_id: new_judge.id)
        expect(same_dog_different_judge_rating).to be_valid
      end

      it 'a judge cannot rate the same dog more than once' do
        existing_rating = Rating.create!(valid_details)
        dog_details_with_repeat_judge_dog_pair = { cuteness: 10, coolness: 10, judge_id: existing_rating.judge_id, dog_id: existing_rating.dog_id }

        same_judge_and_dog_rating = Rating.new dog_details_with_repeat_judge_dog_pair
        expect(same_judge_and_dog_rating).to be_invalid
      end
    end
  end
end
