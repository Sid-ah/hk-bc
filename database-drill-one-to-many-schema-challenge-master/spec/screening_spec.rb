require_relative '../screening'

describe Screening do
  let(:screening) { Screening.new(movie_title: 'Casablanca', start_time: '11:00') }

  it 'has a movie title' do
    expect(screening.movie_title).to eq 'Casablanca'
  end

  it 'has a start time' do
    expect(screening.start_time).to eq '11:00'
  end
end
