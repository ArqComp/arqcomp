class StudyCategory < ActiveRecord::Base

  acts_as_indexed :fields => [:name]

  belongs_to :image
  has_many :studies, :dependent => :delete_all
  
  validates :name, :presence => true, :uniqueness => true
  validates :image, :presence => true
end
