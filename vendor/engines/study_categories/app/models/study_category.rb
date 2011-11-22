class StudyCategory < ActiveRecord::Base

  acts_as_indexed :fields => [:name]

  validates :name, :presence => true, :uniqueness => true
  
  belongs_to :image
  has_many :studies
end
