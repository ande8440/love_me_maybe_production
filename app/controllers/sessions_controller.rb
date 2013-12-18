class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:session][:email])
    begin
	    if user && user.authenticate(params[:session][:password])
		    sign_in user
		    redirect_to root_url
	    else
		    flash.now[:error] = 'Invalid email/password combination'
		    render 'new'
	 #create an error message and re-render the signin form.
	    end
    rescue
	    flash.now[:error] = 'Invalid email/password combination'
	    render 'new'
    end
  end
  
=begin  
  def create_FB
    omniauth = request.env["omniauth.auth"]
    authenticated_user = User.find_by_provider_and_uid(omniauth['provider'], omniauth['uid'])
    email_user = User.find_by_email(omniauth['info']['email'])

    if authenticated_user
	  flash[:notice] = "Signed in successfully."
	  authenticated_user.from_omniauth(omniauth)
	  authenticated_user.save
	  sign_in(authenticated_user)
	  redirect_to root_url
    elsif current_user
	    current_user.from_omniauth(omniauth)
	    current_user.save
	    flash[:notice] = "Authentication successful."
	    redirect_to root_url
    elsif email_user
	    email_user.from_omniauth(omniauth)
	    if email_user.save
		    flash[:notice] = "Authentication successful."
	    else
		    session[:omniauth] = omniauth.except('extra')
	    end
		    sign_in(email_user)
		    redirect_to root_url 
    else
	    user = User.new
	    user.from_omniauth(omniauth)

	    if user.save
		    flash[:notice] = "Signed in successfully."
		    sign_in(user)
		    redirect_to root_url
	    else
		    session[:omniauth] = omniauth.except('extra')
		    redirect_to new_user_path
	    end
	    
	    #session[:user_id] = user.id
	    #redirect_to root_url
    end
	  
  end


=end

def destroy
    sign_out
    redirect_to root_path
end

end
