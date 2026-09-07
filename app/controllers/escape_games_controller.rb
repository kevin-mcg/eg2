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

  def check_answers
    @escape_game = EscapeGame.find(params[:id])
    submitted = params[:answers] || {}

    puts "The submitted answers are:"
    puts submitted

    @results = @escape_game.questions.index_with do |q|
      puts "So, submitted[q.id.to_s]) is:"
      puts submitted[q.id.to_s]
      q.correct?(submitted[q.id.to_s])
    end

    # @results = @escape_game.questions.index_with do |q| q.correct?(submitted[q.id.to_s]) end

    puts "The @results are:"
    puts @results
    puts "@results.first"
    puts @results.first
    # puts "@results.first class?"
    # puts @results.first.class
    # Array

    # @results
    # => 
    # {#<Question:0x000072b93c00ac90
    #   id: 12,
    #   question: "Well, did you?",
    #   answer: "yes",
    #   escape_game_id: 3,
    #   created_at: "2026-09-02 13:40:04.347530000 +0000",
    #   updated_at: "2026-09-02 13:40:04.347530000 +0000">=>true}
    # eg2(dev)> @results.first
    # => 
    # [#<Question:0x000072b93c00ac90
    #   id: 12,
    #   question: "Well, did you?",
    #   answer: "yes",
    #   escape_game_id: 3,
    #   created_at: "2026-09-02 13:40:04.347530000 +0000",
    #   updated_at: "2026-09-02 13:40:04.347530000 +0000">,
    # true]
    # eg2(dev)> @results.first.last
    # => true

    


    if @results.first.last == true
      puts "KMcG - correct answer here"
      redirect_to @escape_game,
        notice: 'Yay, your answer(s) are correct!'
    else
      puts "KMcG - incorrect answer here"
      redirect_to @escape_game,
        alert: 'At least one of your answers is incorrect. Try again.'
    end

    # respond_to do |format|
    #   puts "The format is:"
    #   puts format
    #   puts format.inspect
    #   puts "KMcG1"
    #   format.turbo_stream
    #   puts "KMcG2"
    #   format.html { redirect_to @escape_game }
    # end
  end

  private

  def escape_game_params
    params.require(:escape_game).
            permit(:title, :description, :difficulty)
  end

  def build_feedback(results)
    correct_count = results.values.count(true)
    "#{correct_count}/#{results.size} bonnes réponses"
  end
end
