class Update < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :text]

  validates :title, :presence => true, :uniqueness => true, :length => { :maximum => 32 }
  
  belongs_to :image, :class_name => 'Image'
  
end
