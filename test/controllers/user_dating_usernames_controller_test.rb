require 'test_helper'

class UserDatingUsernamesControllerTest < ActionController::TestCase
  setup do
    @user_dating_username = user_dating_usernames(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:user_dating_usernames)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user_dating_username" do
    assert_difference('UserDatingUsername.count') do
      post :create, user_dating_username: { dating_site_id: @user_dating_username.dating_site_id, dating_site_username: @user_dating_username.dating_site_username, user_id: @user_dating_username.user_id }
    end

    assert_redirected_to user_dating_username_path(assigns(:user_dating_username))
  end

  test "should show user_dating_username" do
    get :show, id: @user_dating_username
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user_dating_username
    assert_response :success
  end

  test "should update user_dating_username" do
    patch :update, id: @user_dating_username, user_dating_username: { dating_site_id: @user_dating_username.dating_site_id, dating_site_username: @user_dating_username.dating_site_username, user_id: @user_dating_username.user_id }
    assert_redirected_to user_dating_username_path(assigns(:user_dating_username))
  end

  test "should destroy user_dating_username" do
    assert_difference('UserDatingUsername.count', -1) do
      delete :destroy, id: @user_dating_username
    end

    assert_redirected_to user_dating_usernames_path
  end
end
