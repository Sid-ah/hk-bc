require_relative 'politician.rb'

describe Politician do

  before :each do
    #You will need to BEGIN a new transaction here
    #ex: sqlite_db_object.transaction
  end

  after :each do
    #You will need to ROLLBACK here
    #ex: sqlite_db_object.rollback
  end

  it 'should fetch a politician based on a query' do
  end

  it 'should provide a count of all politicians' do
  end

  it 'should save new politician objects to the database' do
  end

  it 'should update existing politicians in the database' do
  end

  it 'should delete a politician from the database' do
  end

  #...?
end
