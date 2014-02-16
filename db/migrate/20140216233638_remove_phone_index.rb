class RemovePhoneIndex < ActiveRecord::Migration
  def change
	  remove_index :users, :user_phone
  end
end
