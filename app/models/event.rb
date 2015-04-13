class Event < ActiveRecord::Base
	
	has_many :ticket
	has_many :users, through: :tickets

	validates :title, presence: true
	validates :place, presence: true
	validates :description, presence: true
	validates :event_date, presence: true
	validates :attendance, presence: true, numericality: { only_integer: true, greater_than: 0 }
	validates :activities, presence: true
	
	# return current events
	def self.current
    Event.where("event_date >?", Time.now)
	end

  # number of seconds in a day
  @@day = 86400
  # will return first event; not handling multiple events in a single day
  def self.todays_event
  	Event.where("event_date between ? and ?", 
  		          Time.now - @@day,
  		          Time.now + @@day).first
  end

	def current_attendance
		all_tickets = Ticket.where("event_id =?", self.id)
    all_tickets.inject(0){|sum, t| sum + t.number_of_children}
	end

  # list all users registered for the event
  def list_of_users
    all_tickets = Ticket.where("event_id =?", self.id)
    all_tickets.map{|t| User.find(t.user_id)}
  end

end
