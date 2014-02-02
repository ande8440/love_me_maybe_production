class DateRequest < ActiveRecord::Base
	belongs_to :user
	has_many :date_responses

	validates :date_phone, length: { minimum: 14, maximum: 14, message: "Phone must be valid (999) 999-9999 format" }, uniqueness: { case_sensitive: false, message: "You can't have multiple dates with the same phone number" }, allow_blank: true, allow_nil: true
	validates :date_rating, presence: {message: "What did you think of the date?!"}
	validates :date_comment, presence: {message: "Comment can't be blank"}
	validates :first_name, presence: {message: "Must provide first name"}
	validate :check_for_phone_or_username

	def check_for_phone_or_username
		if ! date_username.blank? || ! date_username_site.blank?
			if date_username.blank? || date_username_site.blank?
				errors.add(:date_username, "Must provide both date username and site")
			end
		end

		if date_phone.blank?
			if date_username.blank? || date_username_site.blank?
				errors.add(:date_username, "Date username/site information must be provided if you do not provide phone number")
			end
			previous_requests = DateRequest.where("user_id = ?", self.user_id)
			previous_requests.each do |request|
				if request.date_username == self.date_username && request.date_username_site == self.date_username_site && ! self.date_username.blank?
					errors.add(:date_username, "We're sorry. You have already added a date matching the information provided.")
				end
			end
		end
	end
end
