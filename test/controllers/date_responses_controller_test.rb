require 'test_helper'

class DateResponsesControllerTest < ActionController::TestCase
  setup do
    @date_response = date_responses(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:date_responses)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create date_response" do
    assert_difference('DateResponse.count') do
      post :create, date_response: { date_request_id: @date_response.date_request_id, date_response_comment: @date_response.date_response_comment, date_response_first_name: @date_response.date_response_first_name, date_response_last_name: @date_response.date_response_last_name, date_response_phone: @date_response.date_response_phone, date_response_rating: @date_response.date_response_rating, date_response_site: @date_response.date_response_site, date_response_username: @date_response.date_response_username }
    end

    assert_redirected_to date_response_path(assigns(:date_response))
  end

  test "should show date_response" do
    get :show, id: @date_response
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @date_response
    assert_response :success
  end

  test "should update date_response" do
    patch :update, id: @date_response, date_response: { date_request_id: @date_response.date_request_id, date_response_comment: @date_response.date_response_comment, date_response_first_name: @date_response.date_response_first_name, date_response_last_name: @date_response.date_response_last_name, date_response_phone: @date_response.date_response_phone, date_response_rating: @date_response.date_response_rating, date_response_site: @date_response.date_response_site, date_response_username: @date_response.date_response_username }
    assert_redirected_to date_response_path(assigns(:date_response))
  end

  test "should destroy date_response" do
    assert_difference('DateResponse.count', -1) do
      delete :destroy, id: @date_response
    end

    assert_redirected_to date_responses_path
  end
end
