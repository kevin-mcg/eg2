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

  def edit
    @escape_game = EscapeGame.find(params[:escape_game_id])
    @questions = @escape_game.questions
    # This doesn't work as the Questions IDs are not set correctly
    # and the URL has the same ID for the escape_game as for the questions
    # http://localhost:3002/escape_games/3/questions/3/edit
    # @question = Question.find(params[:id])

    # This workaround does work when an escape_game has just one question
    @question = @questions.first
  end

  def update
    @escape_game = EscapeGame.find(params[:escape_game_id])
    @question = @escape_game.questions.first
    if @question.update(question_params)
      redirect_to escape_game_path(@escape_game)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).
            permit(:question, :answer)
  end
end
