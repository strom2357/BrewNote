class CreateMaltAdditions < ActiveRecord::Migration
  def change
    create_table :malt_additions do |t|
      t.integer :brew_id
      t.text :notes

      t.timestamps
    end
  end
end
