class CreateFriendSayings < ActiveRecord::Migration
  def change
    create_table :friend_sayings do |t|
      t.string :saying

      t.timestamps
    end
  end
end
