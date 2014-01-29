class DateResponse < ActiveRecord::Base
	belongs_to :date_request

	before_save :set_date_request_id
	before_save :set_uniq_phone_identifier

		validates :date_response_phone, presence: { message: "You must enter a phone number. It will remain secure and confidential" }, length: { minimum: 14, maximum: 14, message: "Phone number must be valid (999) 999-9999 format" }
		validates :date_response_rating, presence: { message: "You have to say how the date went!" }
		validates :date_response_comment, presence: { message: "Please leave an additional comment. Remember, it's anonymous!" }

	def set_uniq_phone_identifier
		if ! self.date_request_id.nil?
			self.uniq_phone_identifier = "#{self.date_request_id.to_s}-#{self.date_response_phone}"
		end
	end

	def phone_already_matched
		if self.uniq_phone_identifier.nil?
			return true
		else
			uniqs = DateResponse.where("uniq_phone_identifier = ?", self.uniq_phone_identifier)
			if uniqs.count > 1
				return false
			else
				return true
			end
		end
	end
		
	def set_date_request_id
		request_user = User.find(self.date_requester_id)

		if self.date_responder_id != nil
			response_user = User.find(self.date_responder_id)
			request_user.date_requests.each do |request|
				if self.date_response_phone == request.date_phone
					self.date_request_id = request.id
					else
						response_user.user_dating_usernames.each do |name|
							if request.date_username == name.dating_site_username && request.date_username_site == name.dating_site_website && ! request.date_username.blank?
								self.date_request_id = request.id
								end
							end
						end
				end
		else
			request_user.date_requests.each do |request|
				if self.date_response_phone == request.date_phone
					self.date_request_id = request.id
				elsif request.date_username == self.date_response_username && request.date_username_site == self.date_response_site && ! self.date_response_username.blank?
					self.date_request_id = request.id
				end
			end
		end
	end


end
