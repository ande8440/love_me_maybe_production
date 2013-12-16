class User < ActiveRecord::Base

	has_many :user_dating_usernames, dependent: :destroy
	has_many :date_requests, dependent: :destroy
	has_many :date_responses, through: :date_requests
	accepts_nested_attributes_for :user_dating_usernames, :allow_destroy => true	
	VALID_HANDLE_REGEX = /\A([!#$&-;=?-\[\]_a-z~]|%[0-9a-fA-F]{2})+\z/
	validates :user_handle, presence: true, length: { maximum: 75 }, format: {with: VALID_HANDLE_REGEX}, uniqueness: { case_sensitive: false }
	validates :first_name, presence: true, length: { maximum: 75 }
	validates :last_name, presence: true, length: { maximum: 75 }

	# still need to do whole (312) 343-2234 format thing BE and FE
	validates :user_phone, presence: true, length: { maximum: 75 }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :user_email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

	# still have to do verification, confirmation, MD5 hash
	validates :user_password, presence: true, length: { minimum: 6 }
	validates :user_password_confirmation, presence: true
end
