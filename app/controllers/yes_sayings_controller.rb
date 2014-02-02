class YesSayingsController < ApplicationController
  before_action :set_yes_saying, only: [:show, :edit, :update, :destroy]
  before_action :check_if_admin

  # GET /yes_sayings
  # GET /yes_sayings.json
  def index
    @yes_sayings = YesSaying.all
  end

  # GET /yes_sayings/1
  # GET /yes_sayings/1.json
  def show
  end

  # GET /yes_sayings/new
  def new
    @yes_saying = YesSaying.new
  end

  # GET /yes_sayings/1/edit
  def edit
  end

  # POST /yes_sayings
  # POST /yes_sayings.json
  def create
    @yes_saying = YesSaying.new(yes_saying_params)

    respond_to do |format|
      if @yes_saying.save
        format.html { redirect_to @yes_saying, notice: 'Yes saying was successfully created.' }
        format.json { render action: 'show', status: :created, location: @yes_saying }
      else
        format.html { render action: 'new' }
        format.json { render json: @yes_saying.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /yes_sayings/1
  # PATCH/PUT /yes_sayings/1.json
  def update
    respond_to do |format|
      if @yes_saying.update(yes_saying_params)
        format.html { redirect_to @yes_saying, notice: 'Yes saying was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @yes_saying.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /yes_sayings/1
  # DELETE /yes_sayings/1.json
  def destroy
    @yes_saying.destroy
    respond_to do |format|
      format.html { redirect_to yes_sayings_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_yes_saying
      @yes_saying = YesSaying.find(params[:id])
    end

    def check_if_admin
	    redirect_to root_path unless current_user.admin?

    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def yes_saying_params
      params.require(:yes_saying).permit(:saying)
    end
end
