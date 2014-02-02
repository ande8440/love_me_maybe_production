class AddMatchedToDateRequests < ActiveRecord::Migration
  def change
    add_column :date_requests, :matched, :boolean, default: false
  end
end
