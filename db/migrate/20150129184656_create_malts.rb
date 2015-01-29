class CreateMalts < ActiveRecord::Migration
  def change
    create_table :malts do |t|
      t.string :name
      t.string :quantity
      t.integer :malt_addition_id

      t.timestamps
    end
  end
end
