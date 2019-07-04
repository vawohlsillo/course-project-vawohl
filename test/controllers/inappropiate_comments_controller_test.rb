require 'test_helper'

class InappropiateCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get inappropiate_comments_new_url
    assert_response :success
  end

  test "should get create" do
    get inappropiate_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get inappropiate_comments_destroy_url
    assert_response :success
  end

  test "should get update" do
    get inappropiate_comments_update_url
    assert_response :success
  end

end
