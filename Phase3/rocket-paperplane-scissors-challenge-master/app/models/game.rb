class Game < ActiveRecord::Base
  scope :recent, -> { order("created_at DESC").limit(5) }

  THROWS = %w(rock paper scissors)
  PLAYERS = %w(user computer)

  validates :computer_throw, presence: true,
    inclusion: { in: THROWS, message: "%{value} is not a valid throw" }

  validates :user_throw, presence: true,
    inclusion: { in: THROWS, message: "%{value} is not a valid throw" }

  validates :winner, presence: true,
    inclusion: { in: PLAYERS, message: "%{value} is not a valid player" }

  before_validation :throw_for_computer, on: :create

  def winner
    return "user" if user_throw_beats_computer_throw?
    return "computer"
  end

  def winner_throw
    return user_throw if user_won?
    return computer_throw
  end

  def loser_throw
    return computer_throw if user_won?
    return user_throw
  end

  def throw_for_computer
    self.computer_throw ||= THROWS.sample
  end

  def user_won?
    user_throw_beats_computer_throw?
  end

  private
  def user_throw_beats_computer_throw?
    return true if user_throw == 'paper' && computer_throw == 'rock'
    return true if user_throw == 'scissors' && computer_throw == 'paper'
    return true if user_throw == 'rock' && computer_throw == 'scissors'
    false
  end
end
