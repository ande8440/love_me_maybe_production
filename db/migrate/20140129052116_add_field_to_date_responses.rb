class AddFieldToDateResponses < ActiveRecord::Migration
  def change
    add_column :date_responses, :uniq_phone_identifier, :string
  end
end
