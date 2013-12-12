class DropDatingSites < ActiveRecord::Migration
  def change

	  drop_table :dating_sites
  end
end
