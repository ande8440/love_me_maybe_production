class WelcomeController < ApplicationController
	def index
		if signed_in?
		  @user = current_user
		end
	end
end
