class User < ActiveRecord::Base

	attr_accessible :first_name,:last_name,:user_email,:user_phone,:user_handle,:admin,:password_digest,:remember_token,:user_password,:user_password_confirmation
	has_many :user_dating_names, dependent: :destroy
	has_many :date_requests, dependent: :destroy
	has_many :date_responses, through: :date_requests



end
