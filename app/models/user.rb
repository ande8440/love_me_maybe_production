class User < ActiveRecord::Base

	has_many :user_dating_usernames, dependent: :destroy
	has_many :date_requests, dependent: :destroy
	has_many :date_responses, through: :date_requests
	accepts_nested_attributes_for :user_dating_usernames, :allow_destroy => true	


end
