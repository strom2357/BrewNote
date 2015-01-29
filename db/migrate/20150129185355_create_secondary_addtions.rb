class CreateSecondaryAddtions < ActiveRecord::Migration
  def change
    create_table :secondary_addtions do |t|
      t.integer :secondary_id
      t.string :name
      t.string :quantity

      t.timestamps
    end
  end
end
