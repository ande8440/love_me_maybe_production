class AddUrlSlugToUsers < ActiveRecord::Migration
  def change
    add_column :users, :url_slug, :string
    add_index :users, :url_slug
  end
end
