class AddOmniauthFieldsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :provider, :string
    add_column :users, :uid, :string
    add_column :users, :oauth_token, :string
    add_column :users, :oauth_expires_at, :datetime
    add_column :users, :fb_image, :string
    add_column :users, :fb_location, :string
    add_column :users, :fb_verified, :boolean
  end
end
