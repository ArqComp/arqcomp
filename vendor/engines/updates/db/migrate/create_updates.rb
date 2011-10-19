class CreateUpdates < ActiveRecord::Migration

  def self.up
    create_table :updates do |t|
      t.string :title
      t.text :text
      t.integer :position

      t.timestamps
    end

    add_index :updates, :id

    load(Rails.root.join('db', 'seeds', 'updates.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "updates"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/updates"})
    end

    drop_table :updates
  end

end
