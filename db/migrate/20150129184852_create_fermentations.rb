class CreateFermentations < ActiveRecord::Migration
  def change
    create_table :fermentations do |t|
      t.integer :brew_id
      t.float :original_gravity
      t.float :final_gravity

      t.timestamps
    end
  end
end
