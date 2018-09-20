require_relative '../dog'

describe Dog do
  let(:dog) { Dog.new('Jayda', 'English Bull Terrier', 'OH-123456') }

  it('has a name') do
    expect(dog.name).to eq 'Jayda'
  end

  it('has a breed') do
    expect(dog.breed).to eq 'English Bull Terrier'
  end

  it('has a license') do
    expect(dog.license).to eq 'OH-123456'
  end
end
