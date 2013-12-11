class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :last_name
      t.string :user_email
      t.integer :user_phone
      t.string :user_handle
      t.boolean :admin
      t.string :password_digest
      t.string :remember_token
      t.string :user_password
      t.string :user_password_confirmation

      t.timestamps
    end
    add_index :users, :user_email, unique: true
    add_index :users, :user_phone, unique: true
    add_index :users, :user_handle, unique: true
  end
end
