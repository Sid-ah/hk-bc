require_relative '../app'

describe Cohort do
  before :each do
    Cohort.transaction
  end

  after :each do
    Cohort.rollback
  end

  pending "Write tests for existing functionality here"
end
