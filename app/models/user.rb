class User < ActiveRecord::Base

	attr_accessor :password, :password_confirmation

	mount_uploader :image, ImageUploader

	has_many :user_dating_usernames, dependent: :destroy
	has_many :date_requests, dependent: :destroy
	has_many :date_responses, through: :date_requests
	accepts_nested_attributes_for :user_dating_usernames, :allow_destroy => true	
	VALID_HANDLE_REGEX = /\A([!#$&-;=?-\[\]_a-z~]|%[0-9a-fA-F]{2})+\z/
	validates :user_handle, presence: true, length: { maximum: 250 }, format: {with: VALID_HANDLE_REGEX}, uniqueness: { case_sensitive: false }, exclusion: {in: %w[signup signin signout contact responses]}
	validates :url_slug, presence: true, length: { maximum: 250 }, uniqueness: { case_sensitive: false }, exclusion: {in: %w[signup signin signout contact responses response_tab terms privacy users date_requests date_responses]}
	validates :first_name, presence: true, length: { maximum: 75 }
	validates :last_name, presence: true, length: { maximum: 75 }

	# still need to do whole (312) 343-2234 format thing BE and FE
	validates :user_phone, presence: true, length: { minimum: 14, maximum: 14, message: "must be valid (999) 999-9999 format" }, uniqueness: { case_sensitive: false }

	VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
	validates :email, presence:   true,
                    format:     { with: VALID_EMAIL_REGEX },
                    uniqueness: { case_sensitive: false }

	validates :password, presence: true, length: { minimum: 6 }, :if => :password_digest_changed?
	validates :password_confirmation, presence: true,:if => :password_digest_changed?

	before_save { |user| user.email = email.downcase }
	before_save :create_remember_token
	validates_confirmation_of :password, :if => :password_digest_changed?

	before_validation :generate_slug

	after_create :send_email_confirm

	
	def to_param
		url_slug
	end

	def generate_slug
		self.url_slug ||= user_handle.parameterize
	end
	
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

	 def send_password_reset
		 generate_token(:password_reset_token)
		 self.password_reset_sent_at = Time.zone.now
		 save!
		 UserMailer.password_reset(self).deliver
	 end

	 def send_email_confirm
		 generate_token(:email_confirm_token)
		 self.email_confirm_sent_at = Time.zone.now
		 save!
		 UserMailer.email_confirm(self).deliver
	 end

	def generate_token(column)
	  begin
	    self[column] = SecureRandom.urlsafe_base64
	  end while User.exists?(column => self[column])
	end
	 


	 def should_validate_password?
	   if params[:user][:password]
		    true
	    else
		    false
	    end
	 end
end
