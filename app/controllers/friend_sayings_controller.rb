class FriendSayingsController < ApplicationController
  before_action :set_friend_saying, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin

  # GET /friend_sayings
  # GET /friend_sayings.json
  def index
    @friend_sayings = FriendSaying.all
  end

  # GET /friend_sayings/1
  # GET /friend_sayings/1.json
  def show
  end

  # GET /friend_sayings/new
  def new
    @friend_saying = FriendSaying.new
  end

  # GET /friend_sayings/1/edit
  def edit
  end

  # POST /friend_sayings
  # POST /friend_sayings.json
  def create
    @friend_saying = FriendSaying.new(friend_saying_params)

    respond_to do |format|
      if @friend_saying.save
        format.html { redirect_to @friend_saying, notice: 'Friend saying was successfully created.' }
        format.json { render action: 'show', status: :created, location: @friend_saying }
      else
        format.html { render action: 'new' }
        format.json { render json: @friend_saying.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /friend_sayings/1
  # PATCH/PUT /friend_sayings/1.json
  def update
    respond_to do |format|
      if @friend_saying.update(friend_saying_params)
        format.html { redirect_to @friend_saying, notice: 'Friend saying was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @friend_saying.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /friend_sayings/1
  # DELETE /friend_sayings/1.json
  def destroy
    @friend_saying.destroy
    respond_to do |format|
      format.html { redirect_to friend_sayings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_friend_saying
      @friend_saying = FriendSaying.find(params[:id])
    end

     def check_if_admin
	    redirect_to root_path unless current_user.admin?

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def friend_saying_params
      params.require(:friend_saying).permit(:saying)
    end
end
