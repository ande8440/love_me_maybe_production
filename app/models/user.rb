class User < ActiveRecord::Base

	has_many :user_dating_names, dependent: :destroy
	has_many :date_requests, dependent: :destroy
	has_many :date_responses, through: :date_requests



end
