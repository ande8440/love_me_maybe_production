class CreateDateRequests < ActiveRecord::Migration
  def change
    create_table :date_requests do |t|
      t.integer :user_id
      t.string :first_name
      t.string :last_name
      t.integer :date_phone
      t.string :date_username
      t.string :date_username_site
      t.text :date_comment
      t.string :date_rating

      t.timestamps
    end
  end
end
