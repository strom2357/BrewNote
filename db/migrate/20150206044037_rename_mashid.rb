class RenameMashid < ActiveRecord::Migration
  def change
  	rename_column :grains, :mash_id, :grain_mash_id
  end
end
