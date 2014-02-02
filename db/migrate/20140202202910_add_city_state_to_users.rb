class AddCityStateToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city, :string
    add_column :users, :state, :string
    add_column :users, :hide_city_state, :boolean, default: false
  end
end
