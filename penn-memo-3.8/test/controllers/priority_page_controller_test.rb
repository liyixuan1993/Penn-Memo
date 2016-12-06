require 'test_helper'

class PriorityPageControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get priority_page_index_url
    assert_response :success
  end

end
