class AddEmailConfirmToUsers < ActiveRecord::Migration
  def change
    add_column :users, :email_confirm_token, :string
    add_column :users, :email_confirm_sent_at, :datetime
  end
end
