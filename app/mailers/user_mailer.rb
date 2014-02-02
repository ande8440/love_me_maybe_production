class UserMailer < ActionMailer::Base
  default from: "LoveMeMaybe <noreply@lovememaybe.co>"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.user_mailer.password_reset.subject
  #
	def password_reset(user)
	  @user = user
	  mail :to => user.email, :subject => "LoveMeMaybe Password Reset"
	end

	def email_confirm(user)
		@user = user
		mail to: user.email, subject: "Welcome to LoveMeMaybe! Please Confirm Email."
	end

	def match_notification(matched_request, matched_user)
		@user = matched_user
		@request = matched_request
		mail to: matched_user.email, subject: "One of your dates responded!"
	end

  
end
