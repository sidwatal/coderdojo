class UsersController < ApplicationController
  def new
  end

  def show
  	@user = User.find(1)
  	past_tickets = Ticket.where("user_id = 1")
  	@past_events = []
  	@current_events = []
  	past_tickets.each do |t|
  	  e = Event.find(t.event_id) 
  	  if e.event_date < Time.now
  	    @past_events << e
  	  else
  	  	@current_events << e
  	  end
  	end	
  end

end
