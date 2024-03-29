class WelcomeController < ApplicationController
	def index
		if signed_in?
		  @user = current_user
		  @response_count = DateResponse.where("date_request_id > ? AND date_requester_id = ?", 0, @user.id).count
		  @request_count = DateRequest.where("user_id = ? AND matched = ?", @user.id, false).count
		end
		
	end

	def response_tab
		if signed_in?
		  @user = current_user
		  @request_count = DateRequest.where("user_id = ? AND matched = ?", @user.id, false).count

		  #getting date responses that match a date request previously made by user
		  @responses = DateResponse.where("date_request_id > ? AND date_requester_id = ?", 0, @user.id)
		  @response_count = @responses.count

		  #sorting responses into matches or anonymous responses
		  @matches = []
		  @anonymous_responses = []
		  @responses.each do |response|
			  request = DateRequest.find(response.date_request_id) if DateRequest.find(response.date_request_id)
			  if request.date_rating == response.date_response_rating && request.date_rating != 'No'
				  @matches << response
			  else
				  @anonymous_responses << response
			  end
		  end

		  @anonymous_min_response = 3
		else
			redirect_to root_path
		end
	end

end
