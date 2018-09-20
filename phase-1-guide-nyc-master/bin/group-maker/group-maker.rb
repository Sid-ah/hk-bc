require 'pp'
require 'garoupa'

module GroupMaker
  extend self

  NUMWEEKS = 3
  ALGOS = [:generate_garoupa_phase, :generate_random_phase]

  def run_algo(name, students, group_size, iterations)
    best = send(name, students, group_size)
    best_extra_pairings = extra_pairings(best)
    iterations.times do |i|
      break if best_extra_pairings.length == 0

      candidate = send(name, students, group_size)
      candidate_extra_pairings = extra_pairings(candidate)

      if candidate_extra_pairings.length < best_extra_pairings.length
        best = candidate
        best_extra_pairings = candidate_extra_pairings
      end
    end

    best
  end

  def generate(students, group_size = 4, iterations = 1000)
    best = run_algo(ALGOS.first, students, group_size, 1)
    best_score = extra_pairings(best).length

    ALGOS.each do |algo|
      break if best_score == 0
      current_best = run_algo(algo, students, group_size, iterations)
      current_score = extra_pairings(current_best).length
      if current_score < best_score
        best = current_best
        best_score = current_score
      end
    end
    best
  end

  def generate_garoupa_phase(students, group_size)
    w1 = Garoupa.make_groups(students,
      target_size: group_size, max_difference: 1)
    w2 = Garoupa.make_groups(students,
      target_size: group_size, max_difference: 1, past_groups: w1.groups)
    w3 = Garoupa.make_groups(students,
      target_size: group_size, max_difference: 1, past_groups: (w1.groups+w2.groups).uniq)

    [w1.groups, w2.groups, w3.groups]
  end

  def generate_random_phase(students, group_size)
    phase = []
    NUMWEEKS.times do
      phase << generate_random_week(students.shuffle, group_size)
    end
    phase
  end

  def generate_random_week(students, group_size)
    week = students.shuffle.each_slice(group_size).to_a
    if students.length % group_size != 0
      small_group = find_shortest(week)
      if small_group.length < 3
        week.delete(small_group)
        until small_group.empty?
          find_shortest(week).push(small_group.pop)
        end
      end
    end
    week
  end

  def benchmark(students, group_size = 4)
    scores = {}
    ALGOS.each do |algo|
      best = run_algo(algo, students, group_size, 1000)
      scores[algo] = extra_pairings(best).length
    end

    pp scores
    winner = scores.max{|a,b| b[1] <=> a[1]}[0]
    puts "winner #{winner}"
  end

  def find_shortest(arr)
    arr.min{|a, b| a.length <=> b.length }
  end

  def extra_pairings(phase)
    scores = Hash.new { |h,k| h[k] = 0 }
    phase.each do |week|
      week.each do |group|
        group.combination(2).each do |pair|
          scores[pair.sort.join(" & ")] += 1
        end
      end
    end
    scores.select {|people, times_paired| times_paired > 1}
  end

  def format(phase)
    str = ""
    phase.each_with_index do |week, i|
      str << "#Week #{i+1}\n"
      week.each_with_index do |group, j|
        str << "#{j+1} (#{group.size}). #{group.join(", ")}\n"
      end
      str << "\n\n"
    end
    str
  end

  def score_report(extra_pairs)
    puts "Group score: #{extra_pairs.length} repeated pairings.\n\n"

    if extra_pairs.length > 0
      extra_pairs.each do |pair, count|
        puts "  #{pair}: #{count}"
      end
      puts "\n\n"
    end
  end
end

if STDIN.tty?
  puts "group-maker expects a list of students via stdin, one student per line."
  puts "ex: ruby group-maker.rb < example.txt"
  exit(1)
end

if ARGV[0] == '-b'
  (7..42).each do |i|
    puts "Testing cohort size #{i}: "
    phase = GroupMaker.benchmark((0...i).to_a.map(&:to_s))
    puts "-----------------------"
  end
else
  students = STDIN.readlines.map(&:strip).reject(&:empty?)
  phase = GroupMaker.generate(students)
  puts GroupMaker.score_report(GroupMaker.extra_pairings(phase))
  puts GroupMaker.format(phase)
end
