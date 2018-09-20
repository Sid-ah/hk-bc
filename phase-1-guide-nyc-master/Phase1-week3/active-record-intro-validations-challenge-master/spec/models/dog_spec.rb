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

    describe 'a dog has many ratings' do
      before(:each) do
        @owner = Person.create(first_name: 'Teagan', last_name: 'Hickman')
        @dog = Dog.create(name: 'Tenley', license: 'OH-9384764', age: 1, breed: 'Golden Doodle', owner_id: @owner.id)
        @judge_1 = Person.create(first_name: 'Lilibeth', last_name: 'Parish')
        @judge_2 = Person.create(first_name: 'Rebekah', last_name: 'Bennett')
        @rating_1 = Rating.create(coolness: 10, cuteness: 10, judge_id: @judge_1.id, dog_id: @dog.id)
        @rating_2 = Rating.create(coolness: 9, cuteness: 10, judge_id: @judge_2.id, dog_id: @dog.id)
      end

      describe '#ratings' do
        it 'returns the ratings made for the dog' do
          expect(@dog.ratings).to match_array [@rating_1, @rating_2]
        end

        it 'returns a collection of rating objects' do
          @dog.ratings.each do |rating|
            expect(rating).to be_an_instance_of Rating
          end
        end
      end

      describe '#ratings=' do
        before(:each) do
          @new_judge = Person.create(first_name: 'Jenn', last_name: 'Mills')
          @new_rating = Rating.new(coolness: 8, cuteness: 10, judge_id: @new_judge.id)
        end

        it 'changes the ratings that a dog has' do
          expect(@dog.ratings).to match_array [@rating_1, @rating_2]
          @dog.ratings = [@new_rating]
          expect(@dog.ratings).to match_array [@new_rating]
        end

        it 'disassociates the dog from previous ratings' do
          expect(@dog.ratings).to include @rating_1
          @dog.ratings = [@new_rating]
          expect(@dog.ratings).to_not include @rating_1
        end
      end
    end
  end

  describe 'validations' do
    before(:each) do
      @owner = Person.create(first_name: 'Cody', last_name: 'Milton')
    end

    let(:valid_details) do
      { :name     => 'Rover',
        :license  => 'MI-1234567',
        :age      => 3,
        :breed    => 'Beagle',
        :owner_id => @owner.id }
    end

    it 'requires a name' do
      dog = Dog.new valid_details.except(:name)
      expect(dog).to be_invalid
    end

    it 'requires a license' do
      dog = Dog.new valid_details.except(:license)
      expect(dog).to be_invalid
    end

    it 'requires a unique license' do
      tenley = Dog.create!(name: 'Tenley', license: 'OH-9384764', age: 1, breed: 'Golden Doodle', owner_id: @owner.id)
      taken_license = tenley.license

      dog = Dog.new valid_details.merge(license: taken_license)
      expect(dog).to be_invalid
    end

    describe 'requires a license with the proper format' do
      it 'must begin with two letters' do
        incorrect_state_abbreviation_details = valid_details.merge(license: 'O-1234567')
        dog = Dog.new(incorrect_state_abbreviation_details)
        expect(dog).to be_invalid
      end

      it 'must begin with a US state abbreviation' do
        invalid_details = valid_details.merge(license: 'XX-1234567')

        dog = Dog.new(invalid_details)
        expect(dog).to be_invalid
      end

      it 'must have a dash after the state abbreviation' do
        no_dash_details = valid_details.merge(license: 'OH1234567')
        dog = Dog.new(no_dash_details)
        expect(dog).to be_invalid
      end
    end

    describe 'age' do
      it 'does not require an age' do
        dog = Dog.new valid_details.except(:age)
        expect(dog).to be_valid
      end

      it 'requires a given age to be greater than or equal to zero' do
        invalid_details = valid_details.merge(age: -1)

        dog = Dog.new(invalid_details)
        expect(dog).to be_invalid
      end
    end

    describe 'requires an owner' do
      it 'is invalid without an owner_id' do
        dog = Dog.new valid_details.except(:owner_id)
        expect(dog).to be_invalid
      end

      it 'is invalid if the owner_id points to a record that doesn\'t exist' do
        id_of_nonexistant_person = Person.pluck(:id).max + 1

        dog = Dog.new valid_details.merge(owner_id: id_of_nonexistant_person)
        expect(dog).to be_invalid
      end
    end
  end
end
