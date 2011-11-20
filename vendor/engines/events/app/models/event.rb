class Event < ActiveRecord::Base

  has_event_calendar
  acts_as_indexed :fields => [:name]

	def color
	  '#2670C3'
	end

  validates :name, :presence => true, :uniqueness => true
  
end
