class CreateDatingSites < ActiveRecord::Migration
  def change
    create_table :dating_sites do |t|
      t.string :site

      t.timestamps
    end
  end
end
