class ChangePhoneToDateRequest < ActiveRecord::Migration
  def change
	  change_column :date_requests, :date_phone, :string
	  change_column :date_responses, :date_response_phone, :string
  end
end
