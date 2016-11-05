require 'test_helper'

class AdminsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @admin = admins(:one)
  end

  test "should get index" do
    get admins_url
    assert_response :success
  end

  test "should get new" do
    get new_admin_url
    assert_response :success
  end

  test "should create admin" do
    assert_difference('Admin.count') do
      post admins_url, params: { admin: { Author: @admin.Author, Content: @admin.Content, Title: @admin.Title, date: @admin.date, file: @admin.file, tag: @admin.tag } }
    end

    assert_redirected_to admin_url(Admin.last)
  end

  test "should show admin" do
    get admin_url(@admin)
    assert_response :success
  end

  test "should get edit" do
    get edit_admin_url(@admin)
    assert_response :success
  end

  test "should update admin" do
    patch admin_url(@admin), params: { admin: { Author: @admin.Author, Content: @admin.Content, Title: @admin.Title, date: @admin.date, file: @admin.file, tag: @admin.tag } }
    assert_redirected_to admin_url(@admin)
  end

  test "should destroy admin" do
    assert_difference('Admin.count', -1) do
      delete admin_url(@admin)
    end

    assert_redirected_to admins_url
  end
end
