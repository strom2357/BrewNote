class CreateSecondaries < ActiveRecord::Migration
  def change
    create_table :secondaries do |t|
      t.integer :fermentation_id
      t.string :duration
      t.text :notes
      
      t.timestamps
    end
  end
end
