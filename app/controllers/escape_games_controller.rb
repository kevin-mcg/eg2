class EscapeGamesController < ApplicationController
  def index
    @escape_games = EscapeGame.all
  end

  def show
    @escape_game = EscapeGame.find(params[:id])
  end

  def edit
    @escape_game = EscapeGame.find(params[:id])
  end

  def update
    @escape_game = EscapeGame.find(params[:id])
    escape_game_params = params.require(:escape_game).
                          permit(:title, :description, :difficulty)
    @escape_game.update(escape_game_params)
    redirect_to @escape_game
  end
end
