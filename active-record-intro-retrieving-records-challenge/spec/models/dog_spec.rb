require_relative '../spec_helper'

describe "Dog" do
  it "is an Active Record model" do
    expect(Dog.new).to be_a_kind_of ActiveRecord::Base
  end
end
