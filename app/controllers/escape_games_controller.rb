class EscapeGamesController < ApplicationController
  def index
    @escape_games = EscapeGame.all
  end
end
