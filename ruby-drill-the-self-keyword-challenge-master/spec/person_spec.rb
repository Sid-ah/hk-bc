require_relative '../person'

describe Person do
  let(:person) { Person.new('Inga', 'Steinmann') }

  it 'has a first name' do
    expect(person.first_name).to eq 'Inga'
  end

  it 'has a last name' do
    expect(person.last_name).to eq 'Steinmann'
  end

  it 'has a full name' do
    expect(person.full_name).to eq 'Inga Steinmann'
  end

  it 'returns itself' do
    expect(person.return_self).to be person
  end
end
