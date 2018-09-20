require_relative '../quad_stage_directions'

describe 'quad_stage_directions' do
  context 'no actors in the play' do
    it 'puts no one on stage' do
      expect(quad_stage_directions(Array.new)).to eq [ Array.new ]
    end
  end

  context 'one actor in the play' do
    let(:directions) { quad_stage_directions([:blue]) }

    it 'has the right number of people on stage at all times' do
      count_of_actors_on_stage = directions.map(&:count)
      expect(count_of_actors_on_stage).to eq [0, 1]
    end

    it 'puts the actor on stage' do
      expect(directions).to eq [[], [:blue]]
    end

    it 'all actor combinations can be created by adding or removing one actor from the previous combination' do
      directions.each_cons(2).each do |consecutive_directions|
        actors_not_in_smaller_grouping = consecutive_directions.max_by(&:count) - consecutive_directions.min_by(&:count)
        expect(actors_not_in_smaller_grouping.count).to eq 1
      end
    end
  end

  context 'two actors in the play' do
    let(:directions) { quad_stage_directions([:blue, :green]) }

    it 'has the right number of people on stage at all times' do
      count_of_actors_on_stage = directions.map(&:count)
      expect(count_of_actors_on_stage).to eq [0, 1, 2, 1]
    end

    it 'each combination of actors appears on stage once' do
      actor_combinations = directions.map(&:sort)
      expect(actor_combinations).to match_array [[], [:blue], [:green], [:blue, :green]]
    end

    it 'all actor combinations can be created by adding or removing one actor from the previous combination' do
      directions.each_cons(2).each do |consecutive_directions|
        actors_not_in_smaller_grouping = consecutive_directions.max_by(&:count) - consecutive_directions.min_by(&:count)
        expect(actors_not_in_smaller_grouping.count).to eq 1
      end
    end
  end

  context 'three actors in the play' do
    let(:directions) { quad_stage_directions([:blue, :green, :red]) }

    it 'has the right number of people on stage at all times' do
      count_of_actors_on_stage = directions.map(&:count)
      expect(count_of_actors_on_stage).to eq [0, 1, 2, 1, 2, 3, 2, 1]
    end

    it 'each combination of actors appears on stage once' do
      actor_combinations = directions.map(&:sort)
      expect(actor_combinations).to match_array [[], [:blue], [:green], [:red], [:blue, :green], [:blue, :red], [:green, :red], [:blue, :green, :red]]
    end

    it 'all actor combinations can be created by adding or removing one actor from the previous combination' do
      directions.each_cons(2).each do |consecutive_directions|
        actors_not_in_smaller_grouping = consecutive_directions.max_by(&:count) - consecutive_directions.min_by(&:count)
        expect(actors_not_in_smaller_grouping.count).to eq 1
      end
    end
  end

  context 'four actors in the play' do
    let(:actors) { [:blue, :green, :red, :yellow] }
    let(:directions) { quad_stage_directions(actors.dup) }

    it 'has the right number of people on stage at all times' do
      count_of_actors_on_stage = directions.map(&:count)
      expect(count_of_actors_on_stage).to eq [0, 1, 2, 1, 2, 3, 2, 1, 2, 3, 4, 3, 2, 3, 2, 1]
    end

    it 'each combination of actors appears on stage once' do
      one_actor_combinations   = actors.permutation(1).to_a
      two_actor_combinations   = actors.permutation(2).map(&:sort).uniq
      three_actor_combinations = actors.permutation(3).map(&:sort).uniq

      expected_combinations = [Array.new] + one_actor_combinations + two_actor_combinations + three_actor_combinations + [actors]

      actor_combinations = directions.map(&:sort)
      expect(actor_combinations).to match_array expected_combinations
    end

    it 'all actor combinations can be created by adding or removing one actor from the previous combination' do
      directions.each_cons(2).each do |consecutive_directions|
        actors_not_in_smaller_grouping = consecutive_directions.max_by(&:count) - consecutive_directions.min_by(&:count)
        expect(actors_not_in_smaller_grouping.count).to eq 1
      end
    end
  end
end
