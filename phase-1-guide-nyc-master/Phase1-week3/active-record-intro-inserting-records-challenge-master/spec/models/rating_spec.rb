require_relative '../spec_helper'

describe "Rating" do
  it "is an Active Record model" do
    expect(Rating.new).to be_a_kind_of ActiveRecord::Base
  end
end
