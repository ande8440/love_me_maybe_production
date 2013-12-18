class User < ActiveRecord::Base

	attr_accessor :password, :password_confirmation

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
	validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

	validates :password, presence: true, length: { minimum: 6 }#, :on => :create #, :if => :should_validate_password?
	validates :password_confirmation, presence: true#,:on => :create #, :if => :should_validate_password?

	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token
	validates_confirmation_of :password#, :on => :create#, :if => :should_validate_password?

	def password=(unencrypted_password)
	    require "bcrypt"
	    @password = unencrypted_password
	    cost = BCrypt::Engine::DEFAULT_COST
	    self.password_digest = BCrypt::Password.create(unencrypted_password, cost: cost)
	end

	def password_confirmation=(unencrypted_password)
	    unless unencrypted_password.blank?
		    @password_confirmation = unencrypted_password
	    end
	end

	 def authenticate(unencrypted_password)
	    require "bcrypt"
        BCrypt::Password.new(password_digest) == unencrypted_password && self
	 end

	 def create_remember_token
	  self.remember_token = SecureRandom.urlsafe_base64
	 end

	 #def should_validate_password?
	  # if self.provider.present? && self.uid.present?
	#	    false
	 #   else
	#	    true
	 #   end
	  #end
end
