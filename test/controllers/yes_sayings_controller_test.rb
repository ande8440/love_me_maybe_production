require 'test_helper'

class YesSayingsControllerTest < ActionController::TestCase
  setup do
    @yes_saying = yes_sayings(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:yes_sayings)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create yes_saying" do
    assert_difference('YesSaying.count') do
      post :create, yes_saying: { saying: @yes_saying.saying }
    end

    assert_redirected_to yes_saying_path(assigns(:yes_saying))
  end

  test "should show yes_saying" do
    get :show, id: @yes_saying
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @yes_saying
    assert_response :success
  end

  test "should update yes_saying" do
    patch :update, id: @yes_saying, yes_saying: { saying: @yes_saying.saying }
    assert_redirected_to yes_saying_path(assigns(:yes_saying))
  end

  test "should destroy yes_saying" do
    assert_difference('YesSaying.count', -1) do
      delete :destroy, id: @yes_saying
    end

    assert_redirected_to yes_sayings_path
  end
end
