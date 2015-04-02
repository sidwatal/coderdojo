class UsersController < ApplicationController
  def new
  end

  def show
  	@user = User.find(params[:id])
  	all_tickets = Ticket.where("user_id =?", params[:id])
  	@past_events = []
  	@current_events = []
  	all_tickets.each do |t|
  	  e = Event.find(t.event_id) 
  	  if e.event_date < Time.now
  	    @past_events << e
  	  else
  	  	@current_events << e
  	  end
  	end	
  end

  def cancel_ticket
    puts "In cancel tickets"
    puts params
    #user = User.find(params[:user])
    ticket = Ticket.where("user_id =? and event_id =?", params[:user], params[:event]).first
    puts "What is da id #{ticket.id}"
    #Ticket.destroy(ticket_id)
    redirect_to '/'
  end
end
