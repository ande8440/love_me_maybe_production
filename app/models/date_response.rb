class DateResponse < ActiveRecord::Base
	belongs_to :date_request

	before_save :set_date_request_id

	def set_date_request_id
		request_user = User.find(self.date_requester_id)

		if self.date_responder_id != nil
	  response_user = User.find(self.date_responder_id)
	  request_user.date_requests.each do |request|
		  if self.date_response_phone == request.date_phone
			  self.date_request_id = request.id
		  else
			  response_user.user_dating_usernames.each do |name|
				  if request.date_username == name.dating_site_username && request.date_username_site == name.dating_site_website
					  self.date_request_id = request.id
				  end
			  end
		  end
	  end
		else
			request_user.date_requests.each do |request|
				if request.date_username == self.date_response_username && request.date_username_site == self.date_response_site
					self.date_request_id = request.id
				end
			end
		end
	end

end
