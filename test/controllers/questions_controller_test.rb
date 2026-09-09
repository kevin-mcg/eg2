require "test_helper"

class QuestionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @escape_game = escape_games(:one)
    @question = questions(:one)
    @other_question = questions(:three)
  end

  test "should get new" do
    get new_escape_game_question_url(@escape_game)
    assert_response :success
  end

  test "should create question" do
    assert_difference("Question.count") do
      post escape_game_questions_url(@escape_game), params: {
        question: { question: "Who left the note?", answer: "The janitor" }
      }
    end
    assert_redirected_to escape_game_path(@escape_game)
  end

  test "should get edit" do
    get edit_escape_game_question_url(@escape_game, @question)
    assert_response :success
  end

  test "should update the requested question, not the first one" do
    # Update both questions of the same escape game with distinct answers.
    # If #update ignored params[:id] and always targeted `questions.first`,
    # one of these two writes would land on the wrong record.
    patch escape_game_question_url(@escape_game, @question), params: {
      question: { question: questions(:one).question, answer: "First answer" }
    }
    assert_redirected_to escape_game_path(@escape_game)

    patch escape_game_question_url(@escape_game, @other_question), params: {
      question: { question: questions(:three).question, answer: "Second answer" }
    }
    assert_redirected_to escape_game_path(@escape_game)

    assert_equal "First answer", @question.reload.answer
    assert_equal "Second answer", @other_question.reload.answer
  end

  test "does not create an invalid question and shows the errors" do
    assert_no_difference("Question.count") do
      post escape_game_questions_url(@escape_game), params: {
        question: { question: "too short", answer: "" }
      }
    end
    assert_response :unprocessable_entity
    assert_match "Answer can&#39;t be blank", response.body
    assert_match "Question is too short", response.body
  end

  test "does not apply an invalid update and shows the errors" do
    patch escape_game_question_url(@escape_game, @question), params: {
      question: { question: "too short", answer: "" }
    }
    assert_response :unprocessable_entity
    assert_equal "The blue one", @question.reload.answer
  end

  test "shows a flash notice after a successful create" do
    post escape_game_questions_url(@escape_game), params: {
      question: { question: "Who left the note?", answer: "The janitor" }
    }
    follow_redirect!
    assert_match "Question was successfully created.", response.body
  end
end
