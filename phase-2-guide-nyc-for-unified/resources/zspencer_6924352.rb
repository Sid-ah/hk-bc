class Judge
  def cast_judgement(cell)
    if cell.neighbor_count < 2 || cell.neighbor_count > 3
      cell.kill!
    end
  end
end


class Cell
  attr_accessor :neighbor_count

  def initialize(neighbor_count)
    self.neighbor_count = neighbor_count
    @state = :alive
  end

  def kill!
    @state = :dead
  end

  def dead?
    @state != :alive
  end
end

class GameOfLife
  attr_reader :cells
  def initialize(board="")
    @cells = board
  end

  def advance!
    unless  population > 1
      @cells = ""
    end
  end

  def population
    cells.length
  end
end

describe "Conways Game of Life" do
  let(:game) { GameOfLife.new(cells) }

  context "when there is one cell on the board" do
    let(:cells) { "1" }

    it "should have one cell" do
      expect(game.population).to eql 1
    end
    context "after advancing" do
      it "should have zero cells" do
        game.advance!
        expect(game.population).to eql 0
      end
    end
  end

  context "when there are two cells next to each other on the board" do
    let(:cells) { "11" }
    it "should have two cells" do
      expect(game.population).to eql 2
    end

    context "after advancing" do
      it "should have two cells" do
        game.advance!
        expect(game.population).to eql 2
      end
    end
  end
end


describe Judge do
  let(:judge) { Judge.new }
  let(:cell) { Cell.new(neighbor_count) }
  describe "#cast_judgement" do
    context "When given a cell with 0 neighbors" do
      let(:neighbor_count) { 0 }
      it "should kill the cell" do
        judge.cast_judgement(cell)
        expect(cell).to be_dead
      end
    end

    context "when given a cell with 2 neighbors" do
      let(:neighbor_count) { 2 }
      it "should not kill the cell" do
        judge.cast_judgement(cell)
        expect(cell).not_to be_dead
      end
    end

    context "when given a cell with 4 neighbors" do
      let(:neighbor_count) { 4 }
      it "should kill the cell" do
        judge.cast_judgement(cell)
        expect(cell).to be_dead
      end
    end
  end
end

describe Cell do
  it "starts out alive" do
    cell = Cell.new(0)
    expect(cell).not_to be_dead
  end

  describe "#kill" do
    it "deadifies the cell" do
      cell = Cell.new(0)
      cell.kill!
      expect(cell).to be_dead
    end
  end
end
