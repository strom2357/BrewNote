class CreateHops < ActiveRecord::Migration
  def change
    create_table :hops do |t|
      t.string :name
      t.string :form
      t.string :quantity
      t.string :boil_time
      t.integer :hop_addition_id

      t.timestamps
    end
  end
end
