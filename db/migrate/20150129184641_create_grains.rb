class CreateGrains < ActiveRecord::Migration
  def change
    create_table :grains do |t|
      t.string :name
      t.string :quantity
      t.string :mash_temp
      t.string :mash_time
      t.integer :mash_id

      t.timestamps
    end
  end
end
