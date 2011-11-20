class AddImageToUpdates < ActiveRecord::Migration
  def self.up
    add_column :updates, :image_id, :integer
  end

  def self.down
    remove_column :updates, :image_id
  end
end
