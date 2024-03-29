class DateResponse < ActiveRecord::Base
	belongs_to :date_request

	before_validation :set_date_request_id
	before_validation :set_uniq_phone_identifier

	after_create :send_match_notification

		validates :date_response_phone, presence: { message: "You must enter a phone number. It will remain secure and confidential" }, length: { minimum: 14, maximum: 14, message: "Phone number must be valid (999) 999-9999 format" }
		validates :date_response_rating, presence: { message: "You have to say how the date went!" }
		validates :date_response_comment, presence: { message: "Please leave an additional comment. Remember, it's anonymous!" }
		validates_uniqueness_of :uniq_phone_identifier, allow_nil: true, allow_blank: true, message: "We're sorry, but it looks like someone matching your information already got a response from this profile."
		validate :check_for_phone_or_username
		

	def set_uniq_phone_identifier
		if ! self.date_request_id.nil?
			self.uniq_phone_identifier = "#{self.date_request_id.to_s}-#{self.date_response_phone}"
			dr= DateRequest.find(self.date_request_id)
			dr.matched = true
			dr.save!
		end
	end

	def check_for_phone_or_username
		if ! date_response_username.blank? || ! date_response_site.blank?
			if date_response_username.blank? || date_response_site.blank?
				errors.add(:date_response_username, "Must provide both username and site")
			end
		end

		if date_response_phone.blank?
			if date_response_username.blank? || date_response_site.blank?
				errors.add(:date_response_username, "Username/site information must be provided if you do not provide phone number")
			end
		end
	end

	def send_match_notification
		if ! self.date_request_id.nil?
			matched_request = DateRequest.find(self.date_request_id)
			matched_user = User.find(matched_request.user_id)
			if matched_user.receive_notifications? && matched_user.email_confirmed?
				UserMailer.match_notification(matched_request, matched_user).deliver
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
				elsif request.date_username == self.date_response_username && request.date_username_site == self.date_response_site && ! self.date_response_username.blank? && ! self.date_response_site.blank?
					self.date_request_id = request.id
				end
			end
		end
	end


end
