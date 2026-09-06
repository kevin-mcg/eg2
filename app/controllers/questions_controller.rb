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
  end

  def update
    puts "Are we here at all?"
    @escape_game = EscapeGame.find(params[:escape_game_id])
    puts "The first question is:"
    puts @escape_game.questions.first
    @question = @escape_game.questions.first
    if @question.update(question_params)
      puts "Updated!!!"
      redirect_to escape_game_path(@escape_game)
    else
      puts "Oh noooo!!!"
      render :edit, status: :unprocessable_entity
    end
  end

  private

  def question_params
    params.require(:question).
            permit(:question, :answer)
  end
end
