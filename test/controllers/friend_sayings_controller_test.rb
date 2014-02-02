require 'test_helper'

class FriendSayingsControllerTest < ActionController::TestCase
  setup do
    @friend_saying = friend_sayings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:friend_sayings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create friend_saying" do
    assert_difference('FriendSaying.count') do
      post :create, friend_saying: { saying: @friend_saying.saying }
    end

    assert_redirected_to friend_saying_path(assigns(:friend_saying))
  end

  test "should show friend_saying" do
    get :show, id: @friend_saying
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @friend_saying
    assert_response :success
  end

  test "should update friend_saying" do
    patch :update, id: @friend_saying, friend_saying: { saying: @friend_saying.saying }
    assert_redirected_to friend_saying_path(assigns(:friend_saying))
  end

  test "should destroy friend_saying" do
    assert_difference('FriendSaying.count', -1) do
      delete :destroy, id: @friend_saying
    end

    assert_redirected_to friend_sayings_path
  end
end
