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
end
