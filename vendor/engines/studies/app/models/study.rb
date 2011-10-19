class Study < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :text]

  validates :title, :presence => true, :uniqueness => true
  
  belongs_to :link, :class_name => 'Resource'
end
