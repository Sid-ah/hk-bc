require_relative "../mean"


describe "mean" do

  it "accepts any number of arguments" do
    expect(method(:mean).arity).to eq(-1)
  end

  it "returns the correct mean" do
    expect(mean(2,4,5,12)).to eq(5)
    expect(mean(-3,10,7)).to eq(4)
  end
end
