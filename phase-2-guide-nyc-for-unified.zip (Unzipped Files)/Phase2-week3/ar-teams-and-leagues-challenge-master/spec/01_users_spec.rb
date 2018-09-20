require 'spec_helper'

describe "Users" do
  it "has four users with correct names" do
    names = User.all.order(:name).map(&:name)

    expect(names).to eq ["Penelope", "Pepe", "Pete", "Priscilla"]
  end
end

describe "Penelope" do
  it "has the correct age" do
    penelope = User.find_by(name: "Penelope")
    expect(penelope.age).to eq 28
  end
end

describe "Priscilla" do
  it "has the correct age" do
    priscilla = User.find_by(name: "Priscilla")

    expect(priscilla.age).to eq 25
  end
end

describe "Pepe" do
  it "has the correct age" do
    pepe = User.find_by(name: "Pepe")

    expect(pepe.age).to eq 34
  end
end

describe "Pete" do
  it "has the correct age" do
    pete = User.find_by(name: "Pete")

    expect(pete.age).to eq 22
  end
end