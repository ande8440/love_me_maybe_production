class Addforeignkeys2ToDateResponses < ActiveRecord::Migration
  def change
	  add_column :date_responses, :date_requester_id, :integer
	  add_column :date_responses, :date_responder_id, :integer
  end
end
