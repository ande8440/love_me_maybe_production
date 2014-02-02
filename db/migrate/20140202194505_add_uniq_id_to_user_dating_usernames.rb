class AddUniqIdToUserDatingUsernames < ActiveRecord::Migration
  def change
    add_column :user_dating_usernames, :uniq_username, :string
  end
end
