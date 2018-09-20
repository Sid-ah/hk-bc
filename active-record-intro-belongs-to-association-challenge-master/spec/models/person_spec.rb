require_relative '../spec_helper'

describe Person do
  it 'is an Active Record model' do
    expect(Person.new).to be_a_kind_of ActiveRecord::Base
  end
end
