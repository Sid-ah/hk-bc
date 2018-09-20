require 'rails_helper'

feature "visiting the homepage" do
  scenario "the user sees a list of recent games and can view them" do
    # Create a most recent game that should definitely appear in the list
    most_recent_game = Game.create!(user_throw: "paper")

    visit "/"

    within(".recent-games") do
      expect(page).to have_content most_recent_game.user_throw
      click_link("Show")
    end

    expect(page).to have_current_path game_path(most_recent_game)
  end

  scenario "the user can start a new game"
end
