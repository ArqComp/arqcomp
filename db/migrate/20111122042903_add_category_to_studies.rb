class AddCategoryToStudies < ActiveRecord::Migration
  def self.up
    add_column :studies, :study_category_id, :integer
    add_index :studies, :study_category_id
  end

  def self.down
    remove_column :studies, :study_category_id
  end
end
