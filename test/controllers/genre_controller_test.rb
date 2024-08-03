require "test_helper"

class GenreControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get genre_new_url
    assert_response :success
  end

  test "should get index" do
    get genre_index_url
    assert_response :success
  end

  test "should get show" do
    get genre_show_url
    assert_response :success
  end

  test "should get edit" do
    get genre_edit_url
    assert_response :success
  end
end
