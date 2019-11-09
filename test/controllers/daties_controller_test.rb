require 'test_helper'

class DatiesControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get daties_new_url
    assert_response :success
  end

  test "should get create" do
    get daties_create_url
    assert_response :success
  end

  test "should get edit" do
    get daties_edit_url
    assert_response :success
  end

  test "should get update" do
    get daties_update_url
    assert_response :success
  end

  test "should get destroy" do
    get daties_destroy_url
    assert_response :success
  end

end
