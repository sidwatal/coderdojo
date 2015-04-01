class UsersController < ApplicationController
  def new
  end

  def show
  	
  	all_tickets = Ticket.where("user_id =?", params[:id])
  	@past_events = []
  	@current_events = []
    puts "There is #{all_tickets.count} tickets for this user"
  	all_tickets.each do |t|
  	  e = Event.find(t.event_id) 
  	  if e.event_date < Time.now
  	    @past_events << e
  	  else
  	  	@current_events << e
  	  end
  	end	
  end

end
