require_relative '../app'

describe Student do
  before :each do
    Student.transaction
  end

  after :each do
    Student.rollback
  end

  pending "Write tests for existing functionality here"
end
