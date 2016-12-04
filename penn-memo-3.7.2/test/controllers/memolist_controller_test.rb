require 'test_helper'

class MemolistControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get memolist_index_url
    assert_response :success
  end

end
