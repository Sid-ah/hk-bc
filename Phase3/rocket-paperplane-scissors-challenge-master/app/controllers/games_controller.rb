class GamesController < ApplicationController
  def index
    @games = Game.recent
  end

  def show
    @game = Game.find(params[:id])
  end

  def new
    @game = Game.new
  end

  def create
    @game = Game.new(game_params)

    if @game.save
      redirect_to @game, notice: 'Game was successfully created.'
    else
      render :new, status: 422
    end
  end

  def destroy
    game = Game.find(params[:id])
    game.destroy
    redirect_to games_url, notice: 'Game was successfully destroyed.'
  end

  private
  def game_params
    params.require(:game).permit(:user_throw)
  end
end
