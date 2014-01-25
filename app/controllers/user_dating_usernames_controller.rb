class UserDatingUsernamesController < ApplicationController
  before_action :set_user_dating_username, only: [:show, :edit, :update, :destroy]

  # GET /user_dating_usernames
  # GET /user_dating_usernames.json
  def index
    @user_dating_usernames = UserDatingUsername.all
  end

  # GET /user_dating_usernames/1
  # GET /user_dating_usernames/1.json
  def show
  end

  # GET /user_dating_usernames/new
  def new
    @user_dating_username = UserDatingUsername.new
  end

  # GET /user_dating_usernames/1/edit
  def edit
  end

  # POST /user_dating_usernames
  # POST /user_dating_usernames.json
  def create
    @user_dating_username = UserDatingUsername.new(user_dating_username_params)

    respond_to do |format|
      if @user_dating_username.save
        format.html { redirect_to @user_dating_username, notice: 'User dating username was successfully created.' }
        format.json { render action: 'show', status: :created, location: @user_dating_username }
      else
        format.html { render action: 'new' }
        format.json { render json: @user_dating_username.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /user_dating_usernames/1
  # PATCH/PUT /user_dating_usernames/1.json
  def update
    respond_to do |format|
      if @user_dating_username.update(user_dating_username_params)
        format.html { redirect_to @user_dating_username, notice: 'User dating username was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @user_dating_username.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /user_dating_usernames/1
  # DELETE /user_dating_usernames/1.json
  def destroy
    @user_dating_username.destroy
    respond_to do |format|
      format.html { redirect_to :back }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_dating_username
      @user_dating_username = UserDatingUsername.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_dating_username_params
      params.require(:user_dating_username).permit(:dating_site_id, :user_id, :dating_site_username)
    end
end
