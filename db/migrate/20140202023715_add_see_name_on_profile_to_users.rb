class AddSeeNameOnProfileToUsers < ActiveRecord::Migration
  def change
    add_column :users, :profile_name_hidden, :boolean, default: false
  end
end
