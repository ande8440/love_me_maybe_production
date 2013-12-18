class ChangePasswordAndEmailNamesToUsers < ActiveRecord::Migration
  def change
	  rename_column :users, :user_password, :password
	  rename_column :users, :user_email, :email
  end
end
