require "test_helper"

class EscapeGamesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @escape_game = escape_games(:one)
  end

  test "should get index" do
    get escape_games_url
    assert_response :success
  end

  test "should show escape game" do
    get escape_game_url(@escape_game)
    assert_response :success
  end

  test "does not create an invalid escape game and shows the errors" do
    assert_no_difference("EscapeGame.count") do
      post escape_games_url, params: {
        escape_game: { title: "", description: "short", difficulty: nil }
      }
    end
    assert_response :unprocessable_entity
    assert_match "Title can&#39;t be blank", response.body
  end

  test "does not apply an invalid update and shows the errors" do
    escape_game = escape_games(:one)
    patch escape_game_url(escape_game), params: {
      escape_game: { title: "", description: "short", difficulty: nil }
    }
    assert_response :unprocessable_entity
    assert_equal "Bissy", escape_game.reload.title
  end

  test "destroys the escape game and redirects to the index" do
    assert_difference("EscapeGame.count", -1) do
      delete escape_game_url(@escape_game)
    end
    assert_redirected_to escape_games_path
    follow_redirect!
    assert_match "Escape game was successfully deleted.", response.body
  end
end
