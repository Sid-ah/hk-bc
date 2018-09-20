require_relative "../rational_number.rb"

describe RationalNumber  do
  let(:one_over_three) { RationalNumber.new(1, 3) }

  it "has a numerator" do
    expect(one_over_three.numerator).to eq 1
  end

  it "has a denominator" do
    expect(one_over_three.denominator).to eq 3
  end

  describe "the reciprocal of a rational number" do
    it "flips the numerator and the denominator" do
      reciprocal = one_over_three.reciprocal

      expect(reciprocal.numerator).to eq 3
      expect(reciprocal.denominator).to eq 1
    end
  end

  describe "string representation" do
    it "is formatted as (numerator/denominator)" do
      expect(one_over_three.to_s).to eq "(1/3)"
    end
  end
end
