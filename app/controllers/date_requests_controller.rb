class DateRequestsController < ApplicationController
  before_action :set_date_request, only: [:show, :edit, :update, :destroy]

  # GET /date_requests
  # GET /date_requests.json
  def index
    @date_requests = DateRequest.all
  end

  # GET /date_requests/1
  # GET /date_requests/1.json
  def show
  end

  # GET /date_requests/new
  def new
    @date_request = DateRequest.new
  end

  # GET /date_requests/1/edit
  def edit
  end

  # POST /date_requests
  # POST /date_requests.json
  def create
    @date_request = DateRequest.new(date_request_params)

    respond_to do |format|
      if @date_request.save
        format.html { redirect_to @date_request, notice: 'Date request was successfully created.' }
        format.json { render action: 'show', status: :created, location: @date_request }
      else
        format.html { render action: 'new' }
        format.json { render json: @date_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /date_requests/1
  # PATCH/PUT /date_requests/1.json
  def update
    respond_to do |format|
      if @date_request.update(date_request_params)
        format.html { redirect_to @date_request, notice: 'Date request was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @date_request.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /date_requests/1
  # DELETE /date_requests/1.json
  def destroy
    @date_request.destroy
    respond_to do |format|
      format.html { redirect_to date_requests_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_date_request
      @date_request = DateRequest.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def date_request_params
      params.require(:date_request).permit(:user_id, :first_name, :last_name, :date_phone, :date_username, :date_username_site, :date_comment, :date_rating)
    end
end
