require_relative '../spec_helper'

describe Person do
  it 'is an Active Record model' do
    expect(Person.new).to be_a_kind_of ActiveRecord::Base
  end

  describe 'associations' do
    describe 'a person has many dogs, acting as an owner' do
      before(:each) do
        @owner = Person.create(first_name: 'Iman', last_name: 'Mathews')
        @dog_1 = Dog.create(name: 'Tenley', license: 'OH-9384764', age: 1, breed: 'Golden Doodle', owner_id: @owner.id)
        @dog_2 = Dog.create(name: 'Jayda', license: 'OH-4893720', age: 3, breed: 'Bull Terrier', owner_id: @owner.id)
      end

      describe '#dogs' do
        it 'returns the dogs owned by the person' do
          expect(@owner.dogs).to match_array [@dog_1, @dog_2]
        end

        it 'returns a collection of dogs' do
          @owner.dogs.each do |dog|
            expect(dog).to be_an_instance_of Dog
          end
        end
      end

      describe '#dogs=' do
        before(:each) do
          @new_dog = Dog.new(name: 'Stella', license: 'OH-1234560', age: 2, breed: 'Pug')
        end

        it 'changes the dogs that belong to a person' do
          expect(@owner.dogs).to match_array [@dog_1, @dog_2]
          @owner.dogs = [@new_dog]
          expect(@owner.dogs).to match_array [@new_dog]
        end

        it 'disassociates the person from previous owned dogs' do
          expect(@owner.dogs).to include @dog_1
          @owner.dogs = [@new_dog]
          expect(@owner.dogs).to_not include @dog_1
        end
      end
    end

    describe 'a person has many ratings, acting as a judge' do
      before(:each) do
        @judge = Person.create(first_name: 'Lilibeth', last_name: 'Parish')
        @owner_1 = Person.create(first_name: 'Teagan', last_name: 'Hickman')
        @dog_1 = Dog.create(name: 'Tenley', license: 'OH-9384764', age: 1, breed: 'Golden Doodle', owner_id: @owner_1.id)
        @owner_2 = Person.create(first_name: 'Rebekah', last_name: 'Bennett')
        @dog_2 = Dog.create(name: 'Jayda', license: 'OH-4893720', age: 3, breed: 'Bull Terrier', owner_id: @owner_2.id)
        @rating_1 = Rating.create(coolness: 10, cuteness: 10, judge_id: @judge.id, dog_id: @dog_1.id)
        @rating_2 = Rating.create(coolness: 9, cuteness: 10, judge_id: @judge.id, dog_id: @dog_2.id)
      end

      describe '#ratings' do
        it 'returns the ratings made by the person' do
          expect(@judge.ratings).to match_array [@rating_1, @rating_2]
        end

        it 'returns a collection of rating objects' do
          @judge.ratings.each do |rating|
            expect(rating).to be_an_instance_of Rating
          end
        end
      end

      describe '#ratings=' do
        before(:each) do
          @new_owner = Person.create(first_name: 'Jenn', last_name: 'Mills')
          @new_dog = Dog.create(name: 'Stella', license: 'OH-1234560', age: 2, breed: 'Pug', owner_id: @new_owner.id)
          @new_rating = Rating.new(coolness: 8, cuteness: 10, dog_id: @new_dog.id)
        end

        it 'changes the ratings that a person has' do
          expect(@judge.ratings).to match_array [@rating_1, @rating_2]
          @judge.ratings = [@new_rating]
          expect(@judge.ratings).to match_array [@new_rating]
        end

        it 'disassociates the peron from previous ratings' do
          expect(@judge.ratings).to include @rating_1
          @judge.ratings = [@new_rating]
          expect(@judge.ratings).to_not include @rating_1
        end
      end
    end
  end
end
