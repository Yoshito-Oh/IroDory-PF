require 'test_helper'

class Public::PostImageCommentsControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get public_post_image_comments_create_url
    assert_response :success
  end

  test "should get destroy" do
    get public_post_image_comments_destroy_url
    assert_response :success
  end

end
