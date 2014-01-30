class UserMailer < ActionMailer::Base
  default from: "NoReply@lovememaybe.co"

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

  
end
