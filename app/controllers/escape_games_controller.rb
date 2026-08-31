class EscapeGamesController < ApplicationController
  def index
    @escape_games = EscapeGame.all
  end

  def show
    @escape_game = EscapeGame.find(params[:id])
    @questions = @escape_game.questions
  end

  def edit
    @escape_game = EscapeGame.find(params[:id])
  end

  def update
    @escape_game = EscapeGame.find(params[:id])
    @escape_game.update(escape_game_params)
    redirect_to @escape_game
  end

  def new
    @escape_game = EscapeGame.new
  end

  def create
    @escape_game = EscapeGame.new(escape_game_params)
    @escape_game.save
    redirect_to escape_game_path(@escape_game)
  end

  def destroy
    @escape_game = EscapeGame.find(params[:id])
    @escape_game.destroy
    redirect_to @escape_game, status: :see_other
  end

  private

  def escape_game_params
    params.require(:escape_game).
            permit(:title, :description, :difficulty)
  end
end
