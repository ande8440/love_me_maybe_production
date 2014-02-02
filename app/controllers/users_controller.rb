class UsersController < ApplicationController

  include SessionsHelper
  before_action :set_user, only: [:show, :edit, :update, :destroy]
  before_action :check_signed_in, only: [:new]

  # GET /users
  # GET /users.json
  def index
	  redirect_to root_path unless current_user.admin?
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
	  
	  session[:your_response] = nil
	  session[:request] = nil
	  
  end

  # GET /users/new
  def new
    @user = User.new
    @user.user_dating_usernames.build
  end

  # GET /users/1/edit
  def edit
	  redirect_to root_path unless signed_in? && @user == current_user || current_user.admin?
		 

  end

  # POST /users
  # POST /users.json
  def create
    @user = User.new(user_params)

    respond_to do |format|
      if @user.save
	      @user.user_dating_usernames.each {|name| name.destroy unless name.dating_site_username.length > 0 }
	      sign_in @user
        format.html { redirect_to root_path, notice: 'Welcome to LoveMeMaybe!' }
        format.json { render action: 'show', status: :created, location: @user }
      else
        format.html { render action: 'new' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
  def update
    respond_to do |format|
      if @user.update(user_params)
	      @user.user_dating_usernames.each {|name| name.destroy unless name.dating_site_username.length > 0 }

	  cookies.permanent[:remember_token] = @user.remember_token


        format.html { redirect_to root_url+@user.url_slug, notice: 'User was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find_by_url_slug!(params[:id])
    end

    def check_signed_in
	    if signed_in?
		    redirect_to root_path
	    end
    end


    def check_user_edit
	    
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:first_name, :last_name, :city, :state, :hide_city_state, :receive_notifications, :email, :user_phone, :user_handle, :image, :admin, :profile_name_hidden, :password_digest, :password_reset_token, :password_reset_sent_at, :remember_token, :email_confirm_token, :email_confirm_sent_at, :email_confirmed, :password, :password_confirmation, user_dating_usernames_attributes: [:dating_site_username, :dating_site_website])
    end
end
