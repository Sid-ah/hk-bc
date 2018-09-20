require_relative '../screen'

describe Screen do
  let(:casablanca_screening) { double('screening', { movie_title: 'Casablanca', start_time: '11:00' }) }
  let(:gone_with_the_wind_screening) { double('screening', { movie_title: 'Gone with the Wind', start_time: '18:00' }) }
  let(:screen) { Screen.new(number: 1, screenings: [casablanca_screening, gone_with_the_wind_screening]) }

  it 'has a number' do
    expect(screen.number).to eq 1
  end

  it 'has screenings' do
    expect(screen.screenings).to match_array [casablanca_screening, gone_with_the_wind_screening]
  end

  it 'adds a screening' do
    wizard_of_oz_screening = double('screening')
    expect(screen.screenings).to_not include wizard_of_oz_screening
    screen << wizard_of_oz_screening
    expect(screen.screenings).to include wizard_of_oz_screening
  end

  it 'cancels a screening' do
    expect(screen.screenings).to include casablanca_screening
    screen.cancel(start_time: '11:00', movie_title: 'Casablanca')
    expect(screen.screenings).to_not include casablanca_screening
  end

  it 'reassigns screenings' do
    wizard_of_oz_screening = double('screening')
    citizen_kane_screening = double('screening')

    screen.screenings = [wizard_of_oz_screening, citizen_kane_screening]
    expect(screen.screenings).to match_array [wizard_of_oz_screening, citizen_kane_screening]
  end
end
