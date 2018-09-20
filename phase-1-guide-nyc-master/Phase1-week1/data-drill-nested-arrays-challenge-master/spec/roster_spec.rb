require_relative '../roster'

describe 'generate_roster' do
  let(:roster) { generate_roster }
  let(:just_player_data) { roster[1..-1] }

  it 'has a header row' do
    desired_headers = ['Number', 'Name', 'Position', 'Points per Game']
    roster_headers = roster.first

    expect(roster_headers).to eq desired_headers
  end

  it 'returns the appropriate player numbers' do
    desired_numbers = [12, 9, 31, 18, 22]
    player_numbers = just_player_data.map { |categories| categories.first }

    expect(player_numbers).to eq desired_numbers
  end

  it 'returns the appropriate player names' do
    desired_names = ['Joe Schmo', 'Ms. Buckets', 'Harvey Kay', 'Sally Talls', 'MK DiBoux']
    player_names = just_player_data.map { |categories| categories[1] }

    expect(player_names).to eq desired_names
  end

  it 'returns the appropriate player positions' do
    desired_positions = ['Center', 'Point Guard', 'Shooting Guard', 'Power Forward', 'Small Forward']
    player_positions = just_player_data.map { |categories| categories[2] }

    expect(player_positions).to eq desired_positions
  end

  it 'returns 5 game scores for each player' do
    rows_with_five_scores_count = just_player_data.count { |row| row.last.length == 5 }

    expect(rows_with_five_scores_count).to eq 5
  end
end
