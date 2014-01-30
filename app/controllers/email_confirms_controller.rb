class EmailConfirmsController < ApplicationController
  def new
  end

  def create

  end

  def edit
	  @user = User.find_by_email_confirm_token!(params[:id])
	  @user.email_confirmed = true if @user
	  @user.save!
	  cookies.permanent[:remember_token] = @user.remember_token
	    redirect_to root_url, :notice => "Email has been confirmed."
  end
	
  def update
	 
  end  
  
end
