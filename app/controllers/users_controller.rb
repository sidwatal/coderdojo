class UsersController < ApplicationController
  def new
  end

  def show
  	@user = User.find(params[:id])
  	@past_events = @user.current_events
  	@current_events = @user.past_events
  end

  def cancel_ticket
    user = User.find(params[:user])
    ticket = Ticket.where("user_id =? and event_id =?", params[:user], params[:event]).first
    ticket_id = ticket.id
    Ticket.destroy(ticket_id)
    redirect_to user_path(user)
  end

  def users_registered
    @all_tickets = Ticket.where("event_id =?", params[:event_id])
    @event = Event.find(params[:event_id])
    @all_users = @all_tickets.map{|t| User.find(t.user_id)}
    @total_attendance = @all_tickets.inject(0){|sum, t| sum + t.number_of_children}
  end

  # allow only admin
  def index
    if params[:search]
      puts "Searching for a user"
      @users = User.search(params[:search])
      puts @users.count
    else
    @users = User.all
    end
  end
end
