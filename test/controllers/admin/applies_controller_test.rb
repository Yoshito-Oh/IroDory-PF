require 'test_helper'

class Admin::AppliesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_applies_index_url
    assert_response :success
  end

  test "should get show" do
    get admin_applies_show_url
    assert_response :success
  end

  test "should get apply" do
    get admin_applies_apply_url
    assert_response :success
  end

  test "should get reject" do
    get admin_applies_reject_url
    assert_response :success
  end

end
