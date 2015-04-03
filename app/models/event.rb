class Event < ActiveRecord::Base
	
	has_many :ticket
	has_many :users, through: :tickets

	validates :title, presence: true
	validates :place, presence: true
	validates :description, presence: true
	validates :event_date, presence: true
	validates :attendance, presence: true, numericality: { only_integer: true, greater_than: 0 }
	
	# return current events
	def self.current
    Event.where("event_date >?", Time.now)
	end
end
