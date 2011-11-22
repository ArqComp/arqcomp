class CreateStudyCategories < ActiveRecord::Migration

  def self.up
    create_table :study_categories do |t|
      t.string :name
      t.integer :image_id
      t.integer :position

      t.timestamps
    end

    add_index :study_categories, :id

    load(Rails.root.join('db', 'seeds', 'study_categories.rb'))
  end

  def self.down
    if defined?(UserPlugin)
      UserPlugin.destroy_all({:name => "study_categories"})
    end

    if defined?(Page)
      Page.delete_all({:link_url => "/study_categories"})
    end

    drop_table :study_categories
  end

end
