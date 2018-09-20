module GamesHelper
  def headline(game)
    game.user_won? ? "User Won!!!" : "User Lost"
  end

  def result_for_user_throw(game)
    if game.user_won?
      active_result_for(game.user_throw)
    else
      passive_result_for(game.computer_throw)
    end
  end

  def throw_color(throw)
    return "danger" if throw == 'rock'
    return "success" if throw == 'paper'
    return "info" if throw == 'scissors'
  end

  def throw_fa_icon(throw)
    return "fa-hand-rock-o" if throw == "rock"
    return "fa-hand-stop-o" if throw == "paper"
    return "fa-hand-scissors-o" if throw == "scissors"
  end

  private
  def active_result_for(throw)
    return "covers" if throw == 'paper'
    return "cut" if throw == 'scissors'
    return "crushes" if throw == 'rock'
  end

  def passive_result_for(opposing_throw)
    return "is covered by" if opposing_throw == 'paper'
    return "is cut by" if opposing_throw == 'scissors'
    return "is crushed by" if opposing_throw == 'rock'
  end
end
