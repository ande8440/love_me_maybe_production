class ChangePhoneToUsers < ActiveRecord::Migration
  def change

	  change_column :users, :user_phone, :string
  end
end
