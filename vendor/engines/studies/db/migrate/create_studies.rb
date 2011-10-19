class CreateStudies < ActiveRecord::Migration

  def self.up
    create_table :studies do |t|
      t.string :title
      t.integer :link_id
      t.text :text
      t.integer :position

      t.timestamps
    end

    add_index :studies, :id

    load(Rails.root.join('db', 'seeds', 'studies.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "studies"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/studies"})
    end

    drop_table :studies
  end

end
