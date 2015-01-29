class CreateYeastPitches < ActiveRecord::Migration
  def change
    create_table :yeast_pitches do |t|
      t.integer :brew_id
      t.text :notes

      t.timestamps
    end
  end
end
