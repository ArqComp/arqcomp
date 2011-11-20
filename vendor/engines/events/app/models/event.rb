class Event < ActiveRecord::Base
  has_event_calendar
  acts_as_indexed :fields => [:name]

  validates :name, :presence => true, :uniqueness => true
  
end
