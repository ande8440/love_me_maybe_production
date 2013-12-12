require 'test_helper'

class DateRequestsControllerTest < ActionController::TestCase
  setup do
    @date_request = date_requests(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:date_requests)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create date_request" do
    assert_difference('DateRequest.count') do
      post :create, date_request: { date_comment: @date_request.date_comment, date_phone: @date_request.date_phone, date_rating: @date_request.date_rating, date_username: @date_request.date_username, date_username_site: @date_request.date_username_site, first_name: @date_request.first_name, last_name: @date_request.last_name, user_id: @date_request.user_id }
    end

    assert_redirected_to date_request_path(assigns(:date_request))
  end

  test "should show date_request" do
    get :show, id: @date_request
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @date_request
    assert_response :success
  end

  test "should update date_request" do
    patch :update, id: @date_request, date_request: { date_comment: @date_request.date_comment, date_phone: @date_request.date_phone, date_rating: @date_request.date_rating, date_username: @date_request.date_username, date_username_site: @date_request.date_username_site, first_name: @date_request.first_name, last_name: @date_request.last_name, user_id: @date_request.user_id }
    assert_redirected_to date_request_path(assigns(:date_request))
  end

  test "should destroy date_request" do
    assert_difference('DateRequest.count', -1) do
      delete :destroy, id: @date_request
    end

    assert_redirected_to date_requests_path
  end
end
