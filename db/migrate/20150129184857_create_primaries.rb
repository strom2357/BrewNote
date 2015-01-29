class CreatePrimaries < ActiveRecord::Migration
  def change
    create_table :primaries do |t|
      t.integer :fermentation_id
      t.string :fermentation_temp
      t.string :duration
      t.text :notes
      
      t.timestamps
    end
  end
end
