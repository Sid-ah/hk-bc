require_relative '../theater'

describe Theater do
  let(:screen_1) { double('screen') }
  let(:theater) { Theater.new(name: 'Franklin Park 16', screens: [screen_1]) }

  it 'has a name' do
    expect(theater.name).to eq 'Franklin Park 16'
  end

  it 'has screens' do
    expect(theater.screens).to match_array [screen_1]
  end
end
