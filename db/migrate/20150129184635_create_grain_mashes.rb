class CreateGrainMashes < ActiveRecord::Migration
  def change
    create_table :grain_mashes do |t|
      t.integer :brew_id
      t.text :notes

      t.timestamps
    end
  end
end
