class CreateDateResponses < ActiveRecord::Migration
  def change
    create_table :date_responses do |t|
      t.integer :date_request_id
      t.string :date_response_first_name
      t.string :date_response_last_name
      t.integer :date_response_phone
      t.string :date_response_username
      t.string :date_response_site
      t.text :date_response_comment
      t.string :date_response_rating

      t.timestamps
    end
  end
end
