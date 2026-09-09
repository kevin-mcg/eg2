require "test_helper"

class EscapeGameTest < ActiveSupport::TestCase
  def valid_attributes
    { title: "Bissy", description: "A very interesting escape game.", difficulty: 2 }
  end

  test "is valid with a title, a long enough description and a difficulty" do
    assert EscapeGame.new(valid_attributes).valid?
  end

  test "requires a title" do
    assert_not EscapeGame.new(valid_attributes.merge(title: "")).valid?
  end

  test "requires a description of at least 10 characters" do
    assert_not EscapeGame.new(valid_attributes.merge(description: "Short")).valid?
  end

  test "requires a difficulty" do
    assert_not EscapeGame.new(valid_attributes.merge(difficulty: nil)).valid?
  end

  test "destroys its questions" do
    escape_game = escape_games(:one)
    assert_difference("Question.count", -escape_game.questions.count) do
      escape_game.destroy
    end
  end

  test "fixtures satisfy the model validations" do
    escape_games.each { |escape_game| assert escape_game.valid?, escape_game.errors.full_messages.to_sentence }
  end
end
