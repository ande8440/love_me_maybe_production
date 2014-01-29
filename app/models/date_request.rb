class DateRequest < ActiveRecord::Base
	belongs_to :user
	has_many :date_responses

	validates :date_phone, length: { minimum: 14, maximum: 14, message: "must be valid (999) 999-9999 format" }, uniqueness: { case_sensitive: false, message: "You can't have multiple dates with the same phone number" }, allow_blank: true, allow_nil: true
	validates :date_rating, presence: true
	validates :date_comment, presence: true
	validates :first_name, presence: true
end
