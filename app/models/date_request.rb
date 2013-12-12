class DateRequest < ActiveRecord::Base
	belongs_to :user
	has_many :date_responses
end
