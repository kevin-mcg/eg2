class EscapeGamesController < ApplicationController
  def index
    @escape_games = EscapeGame.all
  end

  def show
    @escape_game = EscapeGame.find(params[:id])
  end
end
