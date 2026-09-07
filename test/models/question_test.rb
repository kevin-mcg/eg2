require "test_helper"

class QuestionTest < ActiveSupport::TestCase
  setup do
    @escape_game = escape_games(:one)
  end

  test "is valid with a question and an answer" do
    assert @escape_game.questions.new(question: "Where is the key?", answer: "Under the mat").valid?
  end

  test "requires an escape game" do
    assert_not Question.new(question: "Where is the key?", answer: "Under the mat").valid?
  end

  test "requires a question of at least 10 characters" do
    assert_not @escape_game.questions.new(question: "Too short", answer: "Yes").valid?
    assert_not @escape_game.questions.new(question: "", answer: "Yes").valid?
  end

  test "requires an answer" do
    question = @escape_game.questions.new(question: "Where is the key?", answer: "  ")
    assert_not question.valid?
    assert_includes question.errors[:answer], "can't be blank"
  end
end
