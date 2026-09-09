class QuestionsController < ApplicationController
  def new
    @escape_game = EscapeGame.find(params[:escape_game_id])
    @question = @escape_game.questions.new
  end

  def create
    @escape_game = EscapeGame.find(params[:escape_game_id])
    @question = @escape_game.questions.new(question_params)
    if @question.save
      redirect_to escape_game_path(@escape_game)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).
            permit(:question, :answer)
  end
end
