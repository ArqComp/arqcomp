class Update < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :text]

  validates :title, :presence => true, :uniqueness => true
  
end
