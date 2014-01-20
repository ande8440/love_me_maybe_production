class DateResponsesController < ApplicationController
  before_action :set_date_response, only: [:show, :edit, :update, :destroy]

  # GET /date_responses
  # GET /date_responses.json
  def index
    @date_responses = DateResponse.all
  end

  # GET /date_responses/1
  # GET /date_responses/1.json
  def show
  end

  # GET /date_responses/new
  def new
    @user = User.find(params[:user_id])
    @date_response = DateResponse.new

    respond_to do |format|
		  format.html
		  format.js
	  end
  end

  # GET /date_responses/1/edit
  def edit
  end

  # POST /date_responses
  # POST /date_responses.json
  def create
    
    @date_response = DateResponse.new(date_response_params)
    @user = User.find(params[:date_response][:date_requester_id])


    respond_to do |format|
      if @date_response.save
	      if @date_response.date_request_id == nil
		      session[:request] = nil
		      session[:your_response] = @date_response.id
	      else
		      session[:request] = @date_response.date_request_id
		      session[:your_response] = @date_response.id
	      end
        format.html { redirect_to :back, notice: 'Date response was successfully created.' }
        format.json { render action: 'show', status: :created, location: @date_response }
      else
        format.html { render action: 'new' }
        format.json { render json: @date_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /date_responses/1
  # PATCH/PUT /date_responses/1.json
  def update
    respond_to do |format|
      if @date_response.update(date_response_params)
        format.html { redirect_to @date_response, notice: 'Date response was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @date_response.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /date_responses/1
  # DELETE /date_responses/1.json
  def destroy
    @date_response.destroy
    respond_to do |format|
      format.html { redirect_to date_responses_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_date_response
      @date_response = DateResponse.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def date_response_params
      params.require(:date_response).permit(:date_request_id, :date_response_first_name, :date_response_last_name, :date_response_phone, :date_response_username, :date_response_site, :date_response_comment, :date_response_rating, :date_requester_id, :date_responder_id)
    end
end
