class CreateUserDatingUsernames < ActiveRecord::Migration
  def change
    create_table :user_dating_usernames do |t|
      t.integer :dating_site_id
      t.integer :user_id
      t.string :dating_site_username

      t.timestamps
    end
  end
end
