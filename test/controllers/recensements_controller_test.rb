require 'test_helper'

class RecensementsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recensements_index_url
    assert_response :success
  end

  test "should get create" do
    get recensements_create_url
    assert_response :success
  end

  test "should get update" do
    get recensements_update_url
    assert_response :success
  end

end
