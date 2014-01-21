class CreateYesSayings < ActiveRecord::Migration
  def change
	  
	  
    create_table :yes_sayings do |t|
      t.string :saying

      t.timestamps
    end
  end
end
