class WelcomeController < ApplicationController
	def index
		if signed_in?
		  @user = current_user
		  @response_count = DateResponse.where("date_request_id > ? AND date_requester_id = ?", 0, @user.id).count
		end
		
	end

	def response_tab
		if signed_in?
		  @user = current_user
		  @responses = DateResponse.where("date_request_id > ? AND date_requester_id = ?", 0, @user.id)
		  @response_count = @responses.count
		end
	end

end
