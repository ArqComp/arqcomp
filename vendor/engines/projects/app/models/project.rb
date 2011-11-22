class Project < ActiveRecord::Base

  acts_as_indexed :fields => [:title, :description]

  validates :title, :presence => true, :uniqueness => true
  validates :semester, :presence => true, :format => {:with => /\d{4}\.[12]/ }
  
end
