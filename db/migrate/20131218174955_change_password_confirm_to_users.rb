class ChangePasswordConfirmToUsers < ActiveRecord::Migration
  def change
	  rename_column :users, :user_password_confirmation, :password_confirmation
  end
end
