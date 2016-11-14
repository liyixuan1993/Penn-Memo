require 'test_helper'

class RespondsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @respond = responds(:one)
  end

  test "should get index" do
    get responds_url
    assert_response :success
  end

  test "should get new" do
    get new_respond_url
    assert_response :success
  end

  test "should create respond" do
    assert_difference('Respond.count') do
      post responds_url, params: { respond: { memo_id: @respond.memo_id, respond_content: @respond.respond_content, user_id: @respond.user_id } }
    end

    assert_redirected_to respond_url(Respond.last)
  end

  test "should show respond" do
    get respond_url(@respond)
    assert_response :success
  end

  test "should get edit" do
    get edit_respond_url(@respond)
    assert_response :success
  end

  test "should update respond" do
    patch respond_url(@respond), params: { respond: { memo_id: @respond.memo_id, respond_content: @respond.respond_content, user_id: @respond.user_id } }
    assert_redirected_to respond_url(@respond)
  end

  test "should destroy respond" do
    assert_difference('Respond.count', -1) do
      delete respond_url(@respond)
    end

    assert_redirected_to responds_url
  end
end
