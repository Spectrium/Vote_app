require 'test_helper'

class FokontaniesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get fokontanies_index_url
    assert_response :success
  end

end
