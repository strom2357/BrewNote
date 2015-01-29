class CreateBrewSeshes < ActiveRecord::Migration
  def change
    create_table :brew_seshes do |t|
      t.integer :user_id
      t.integer :brew_id

      t.timestamps
    end
  end
end
