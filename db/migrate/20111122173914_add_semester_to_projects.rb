class AddSemesterToProjects < ActiveRecord::Migration
  def self.up
    add_column :projects, :semester, :string
  end

  def self.down
    remove_column :projects, :semester
  end
end
