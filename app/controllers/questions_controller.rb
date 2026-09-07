class QuestionsController < ApplicationController
  def new
    @escape_game = EscapeGame.find(params[:escape_game_id])
    @question = @escape_game.questions.new
  end

  def create
    @escape_game = EscapeGame.find(params[:escape_game_id])
    @question = @escape_game.questions.new(question_params)
    if @question.save
      redirect_to escape_game_path(@escape_game), notice: "Question was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @escape_game = EscapeGame.find(params[:escape_game_id])
    @question = @escape_game.questions.find(params[:id])
  end

  def update
    @escape_game = EscapeGame.find(params[:escape_game_id])
    @question = @escape_game.questions.find(params[:id])
    if @question.update(question_params)
      redirect_to escape_game_path(@escape_game), notice: "Question was successfully updated."
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
