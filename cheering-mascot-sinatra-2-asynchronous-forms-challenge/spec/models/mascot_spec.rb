require_relative "../spec_helper"

describe Mascot do
  it "knows which sign to hold for some specific cheers" do
    expect(Mascot.sign_for "2 BITS").to eq "Holler!"
  end

  it "holds a generic sign if it doesn't know a cheer" do
    expect(Mascot.sign_for "Other Cheer").to eq "Go Team!"
  end
end
