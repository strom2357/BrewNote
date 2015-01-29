class CreateHopAdditions < ActiveRecord::Migration
  def change
    create_table :hop_additions do |t|
      t.integer :brew_id
      t.text :notes

      t.timestamps
    end
  end
end
