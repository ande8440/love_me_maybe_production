class AddDatingSiteToUserDatingUsernames < ActiveRecord::Migration
  def change
    add_column :user_dating_usernames, :dating_site_website, :string
  end
end
