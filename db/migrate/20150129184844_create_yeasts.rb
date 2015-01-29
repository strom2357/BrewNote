class CreateYeasts < ActiveRecord::Migration
  def change
    create_table :yeasts do |t|
      t.string :name
      t.string :pitch_temp
      t.string :quantity
      t.integer :yeast_pitch_id
      
      t.timestamps
    end
  end
end
