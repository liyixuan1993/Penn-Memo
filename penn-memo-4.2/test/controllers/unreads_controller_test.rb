require 'test_helper'

class UnreadsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @unread = unreads(:one)
  end

  test "should get index" do
    get unreads_url
    assert_response :success
  end

  test "should get new" do
    get new_unread_url
    assert_response :success
  end

  test "should create unread" do
    assert_difference('Unread.count') do
      post unreads_url, params: { unread: { memo_id: @unread.memo_id, notification: @unread.notification, user_id: @unread.user_id } }
    end

    assert_redirected_to unread_url(Unread.last)
  end

  test "should show unread" do
    get unread_url(@unread)
    assert_response :success
  end

  test "should get edit" do
    get edit_unread_url(@unread)
    assert_response :success
  end

  test "should update unread" do
    patch unread_url(@unread), params: { unread: { memo_id: @unread.memo_id, notification: @unread.notification, user_id: @unread.user_id } }
    assert_redirected_to unread_url(@unread)
  end

  test "should destroy unread" do
    assert_difference('Unread.count', -1) do
      delete unread_url(@unread)
    end

    assert_redirected_to unreads_url
  end
end
