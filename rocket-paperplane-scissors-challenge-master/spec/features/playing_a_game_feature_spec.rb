require "rails_helper"

feature "playing a game" do
  context "when user wins the game" do
    xscenario "the user selects a winning throw and is shown the game's result" do
      # stub the computer throw

      # visit '/games/new'

      # user chooses winning throw
      # user sees that the user won and the result for the user throw
    end
  end

  context "when user loses the game" do
    xscenario "the user selects a losing throw and is shown the game's result" do
      # stub the computer throw

      # visit '/games/new'

      # user chooses losing throw
      # user sees that the user lost and the result for the user throw
    end
  end
end
